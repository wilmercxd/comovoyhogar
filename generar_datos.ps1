# ==========================================================================
#  ¿CÓMO VOY? HOGAR — generador de datos
#  Lee las sabanas crudas + roster y produce ventas.json
#  Uso:  .\generar_datos.ps1  [-Corte 2026-08-13]
# ==========================================================================
param(
  [string]$Corte = '',
  [string]$Raiz  = ''
)

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

if (-not $Raiz) { $Raiz = Split-Path -Parent $PSScriptRoot }
$Salida = Join-Path $PSScriptRoot 'ventas.json'

# Parseo temprano de -Corte: lo necesita Fecha-Archivo() para las sabanas cuyo
# nombre no trae fecha (mas abajo, antes de que exista la variable $fCorte
# "oficial" que se calcula en la seccion CORTE).
$corteTemprano = if ($Corte) { [datetime]::ParseExact($Corte,'yyyy-MM-dd',$null) } else { $null }

$errores = New-Object System.Collections.ArrayList
$avisos  = New-Object System.Collections.ArrayList
function Err($m){ [void]$errores.Add($m); Write-Host "  ERROR  $m" -ForegroundColor Red }
function Avi($m){ [void]$avisos.Add($m);  Write-Host "  AVISO  $m" -ForegroundColor Yellow }
function Ok ($m){ Write-Host "  ok     $m" -ForegroundColor DarkGray }

# --------------------------------------------------------------- utilidades
function Get-Fecha([string]$s){
  if ([string]::IsNullOrWhiteSpace($s)) { return $null }
  $s = $s.Trim()
  if ($s -match '^\d{5,6}$') { return [datetime]::FromOADate([double]$s) }   # serial de Excel
  $fmts = [string[]]@('d/M/yyyy','dd/MM/yyyy','yyyy-MM-dd','d-MMM-yyyy','dd-MMM-yyyy',
                      'd/M/yyyy H:mm','dd/MM/yyyy H:mm','yyyy-MM-dd HH:mm:ss')
  $r = [datetime]::MinValue
  if ([datetime]::TryParseExact($s,$fmts,[Globalization.CultureInfo]::InvariantCulture,
                                [Globalization.DateTimeStyles]::None,[ref]$r)) { return $r }
  return $null
}

# Los exportes cambian espacios y mayusculas en los encabezados entre cortes.
function Get-Col($fila,[string[]]$nombres){
  foreach ($n in $nombres) {
    $clave = ($n -replace '\s','').ToLowerInvariant()
    foreach ($p in $fila.PSObject.Properties) {
      if (($p.Name -replace '\s','').ToLowerInvariant() -eq $clave) { return $p.Value }
    }
  }
  return $null
}

function Norm([string]$s){
  if (-not $s) { return '' }
  $t = $s.Normalize([Text.NormalizationForm]::FormD)
  $sb = New-Object Text.StringBuilder
  foreach ($c in $t.ToCharArray()) {
    if ([Globalization.CharUnicodeInfo]::GetUnicodeCategory($c) -ne 'NonSpacingMark') { [void]$sb.Append($c) }
  }
  return ($sb.ToString() -replace '[^A-Za-z0-9 ]','').ToUpperInvariant().Trim()
}

function Ap2([string]$nombre){
  $p = ($nombre.Trim() -split '\s+')
  if ($p.Count -ge 1) { return $p[-1] } else { return '' }
}

# --------------------------------------------------- calendario y festivos
# Festivos colombianos que caen en dias habiles del periodo analizado.
$FESTIVOS = @{
  '2026-07-20' = 'Independencia'
  '2026-08-07' = 'Batalla de Boyaca'
  '2026-08-17' = 'Asuncion de la Virgen'
}
function Es-Habil([datetime]$d){
  if ($d.DayOfWeek -eq [DayOfWeek]::Sunday) { return $false }
  return -not $FESTIVOS.ContainsKey($d.ToString('yyyy-MM-dd'))
}
function Dias-Habiles([datetime]$ini,[datetime]$fin){
  $n = 0; $d = $ini
  while ($d -le $fin) { if (Es-Habil $d) { $n++ }; $d = $d.AddDays(1) }
  return $n
}
function Dia-HabilAnterior([datetime]$d){
  $p = $d.AddDays(-1)
  while (-not (Es-Habil $p)) { $p = $p.AddDays(-1) }
  return $p
}

# ---------------------------------------------------------- esquema de pago
# Tomado de COMISIONES AGOSTO.pdf. escalones = [ventas_desde, valor_por_venta]
$ESQ_TIPO = [ordered]@{
  OUTBOUND = [ordered]@{
    nombre = 'Outbound'
    mes    = @(@(20,10000),@(25,15000),@(30,20000))
    sem    = @(@(6,10000),@(8,15000),@(10,20000))
  }
  BLASTER = [ordered]@{
    nombre = 'Omnicanal'
    mes    = @(@(30,15000),@(35,20000),@(40,25000))
    sem    = @(@(8,15000),@(10,20000),@(12,25000))
  }
}

# Desde agosto de 2026 el esquema se unifica: todos los asesores van por el de
# Omnicanal (mes 30/35/40, semana 8/10/12), sin importar si su tipo de meta es
# OUTBOUND o BLASTER. Julio conserva el esquema por tipo con el que se cerro.
$MES_UNIFICADO = '2026-08'

function Esquema([string]$mk, [string]$tipo) {
  if ($mk -ge $MES_UNIFICADO) { return $ESQ_TIPO.BLASTER }
  return $ESQ_TIPO[$tipo]
}
function Piso($escalones,[double]$ventas){
  $piso = 0; $tarifa = 0
  for ($i=0; $i -lt $escalones.Count; $i++) {
    if ($ventas -ge $escalones[$i][0]) { $piso = $i+1; $tarifa = $escalones[$i][1] }
  }
  return @{ piso = $piso; tarifa = $tarifa; com = [math]::Round($ventas * $tarifa) }
}

# ------------------------------------------------------------------ OTT/VAS
$CAT_OTT = @{
  'PRIME'='Prime'; 'NETFLIXBASICO'='Netflix'; 'HBO'='HBO Max'; 'MAX'='HBO Max'
  'DISNEYPLUS'='Disney+'; 'WINFUTBOL'='Win+ Fútbol'; 'WINPLAY'='Win Play'
}
$CAT_VAS = @{
  'SALUD'='Claro Salud'; 'PETS'='Claro Pets'; 'ASISTENCIAHOGAR'='Asistencia Hogar'
  'ASISTENCIA'='Asistencia Hogar'; 'ULTRAWIFI'='Ultra WiFi'
  'DECODONGLE'='Deco Dongle'; 'DECOHD'='Deco HD'
}

# ================================================================== ROSTER
Write-Host "`n== roster ==" -ForegroundColor Cyan
$rosterPath = Join-Path $PSScriptRoot 'roster.csv'
if (-not (Test-Path $rosterPath)) { throw "No existe roster.csv en $PSScriptRoot" }
$roster = Import-Csv $rosterPath -Delimiter ';' -Encoding UTF8

$sup = $roster | Where-Object { $_.rol -eq 'SUPERVISOR' } | Select-Object -First 1
if (-not $sup) { throw 'El roster no tiene ninguna fila con rol SUPERVISOR' }

$asesores = @($roster | Where-Object { $_.rol -eq 'ASESOR' })
if ($asesores.Count -eq 0) { throw 'El roster no tiene asesores' }
Ok "$($asesores.Count) asesores + supervisor $($sup.nombre)"

$porCC = @{}
foreach ($a in $asesores) {
  $cc = $a.cedula.Trim()
  if ($porCC.ContainsKey($cc)) { Err "cedula repetida en el roster: $cc" }
  if ($a.tipo -notin $ESQ_TIPO.Keys) { Err "tipo de meta desconocido para $($a.nombre): '$($a.tipo)'" }
  $porCC[$cc] = $a
}

# ============================================================ CIERRE OFICIAL
$oficial = @{}
$ofPath = Join-Path $PSScriptRoot 'cierre_julio_oficial.csv'
if (Test-Path $ofPath) {
  foreach ($r in (Import-Csv $ofPath -Delimiter ';' -Encoding UTF8)) {
    $oficial[$r.cedula.Trim()] = [int]$r.instaladas
  }
  Ok "cierre oficial de julio cargado ($($oficial.Count) asesores)"
}

# =================================================================== SABANAS
Write-Host "`n== sabanas ==" -ForegroundColor Cyan
$archivos = @(Get-ChildItem -Path $Raiz -Filter 'SABANA HOGAR*.csv' -File)
if ($archivos.Count -eq 0) { throw "No se encontro ninguna 'SABANA HOGAR*.csv' en $Raiz" }

$COLS = @{
  cc      = @('CC ASESOR')
  asesor  = @('ASESOR')
  estado  = @('ESTADO DIGITACION')
  motivo  = @('MOTIVO DE INCUMPLIMIENTO')
  agenda  = @('FECHA AGENDA')
  venta   = @('FECHA DE VENTA')
  instal  = @('FECHA INSTALACION')
  cliCC   = @('CC CLIENTE')
  cliNom  = @('NOMBRES CLIENTE')
  cliApe  = @('APELLIDOS CLIENTE')
  ciudad  = @('CIUDAD')
  contrato= @('CONTRATO')
  adic    = @('ADICIONAL')
  ot      = @('N°OT','NOT','N OT')
  campana = @('CAMPAÑA')
  tel     = @('TEL1')
}

# Una OT puede venir en dos cortes distintos: gana la del archivo mas reciente.
#
# El orden sale de la fecha del NOMBRE (SABANA HOGAR_dd_mm_aaaa), nunca de
# LastWriteTime: la fecha del sistema es la de cuando se bajo o se copio el
# archivo, no la del corte que contiene. Ordenando por LastWriteTime, una
# sabana vieja descargada despues le sobrescribe los estados a una nueva y
# las ventas recientes desaparecen sin que nadie lo note.
function Fecha-Archivo($archivo) {
  if ($archivo.Name -match '(\d{1,2})[_-](\d{1,2})[_-](\d{4})') {
    try { return [datetime]::new([int]$Matches[3], [int]$Matches[2], [int]$Matches[1]) } catch {}
  }
  # Sabanas de nombre fijo (ej. SABANA HOGAR_AGOSTO_BRQ.csv) que se sobrescriben
  # cada dia: su nombre no trae fecha, y la fecha de archivo de OneDrive no es
  # confiable (puede reflejar cuando sincronizo, no cuando se genero el dato).
  # El -Corte que se pasa a mano es la fecha real en la que confiar.
  if ($corteTemprano) {
    Avi "$($archivo.Name): el nombre no trae fecha, se usa el -Corte indicado ($($corteTemprano.ToString('yyyy-MM-dd'))) como fecha del archivo"
    return $corteTemprano
  }
  Avi "$($archivo.Name): el nombre no trae fecha y no se paso -Corte, se ordena por fecha de archivo (menos confiable)"
  return $archivo.LastWriteTime
}

$ventas       = @{}
$sinFecha     = 0
$congeladas   = 0
$fueraCampana = 0

foreach ($f in ($archivos | Sort-Object @{ Expression = { Fecha-Archivo $_ } })) {
  $fArchivo = Fecha-Archivo $f
  $filas = Import-Csv $f.FullName -Delimiter ';'
  if ($filas.Count -eq 0) { Avi "$($f.Name) esta vacio"; continue }

  foreach ($k in @('cc','estado','agenda','contrato','adic')) {
    if ($null -eq (Get-Col $filas[0] $COLS[$k])) { Err "$($f.Name): falta la columna $($COLS[$k][0])" }
  }

  $tomadas = 0
  foreach ($r in $filas) {
    $cc = "$(Get-Col $r $COLS.cc)".Trim()
    if (-not $porCC.ContainsKey($cc)) { continue }          # asesor de otro equipo

    $fa = Get-Fecha (Get-Col $r $COLS.agenda)
    if (-not $fa) { $sinFecha++; continue }

    $ot = "$(Get-Col $r $COLS.ot)".Trim()

    # La cedula puede coincidir con la de un asesor nuestro por error de
    # digitacion en una fila que en realidad es de otra campaña (visto: una
    # OT de 'STAFF' con la cedula de un asesor de Hogar, pero otro nombre en
    # la columna ASESOR). Se descarta por campaña, no por nombre: el nombre
    # de la sabana trae variantes normales (apellidos truncados) que no son
    # error, la campaña sí es una señal limpia.
    $campana = "$(Get-Col $r $COLS.campana)".Trim().ToUpperInvariant()
    if ($campana -and $campana -notmatch '^HOGAR') {
      $fueraCampana++
      Avi "fila descartada: CC $cc con campaña '$campana' (OT $ot) no es una campaña de Hogar"
      continue
    }

    # '0' es el marcador de "sin OT asignado" en ventas rechazadas, no un OT
    # real: tratarlo como tal colisiona docenas de rechazos de asesores y
    # fechas distintas en una sola clave, y se pisan entre si.
    $clave = if ($ot -and $ot -ne '0') { "OT$ot" } else { "X{0}|{1}|{2}" -f $cc, $fa.ToString('yyyyMMdd'), "$(Get-Col $r $COLS.cliCC)".Trim() }

    # Un mes ya cerrado no se vuelve a tocar: su cierre ya se comunico y se
    # pago. Si una OT de julio cambia de estado en la sabana de agosto, el
    # cierre de julio no se mueve.
    #
    # La condicion se evalua sobre la agenda NUEVA, no la anterior. Una venta
    # que quedo NO INSTALADO el 31/07 y se reagendo al 06/08 es una venta de
    # agosto: no le resta nada a julio (alli no contaba) y tiene que sumar en
    # agosto. Congelarla por haber aparecido antes en la sabana de julio la
    # haria desaparecer de los dos meses.
    #
    # Esto tambien aplica si la venta YA estaba INSTALADO en un mes cerrado y
    # pagado, y una sabana posterior le corrige la fecha agenda a otro mes
    # (visto: OT 475747234 de Yeraldin, instalada, paso de 29/07 a 01/08).
    # Confirmado con Wilmer el 19/08/2026 que ese tipo de correccion es real
    # y debe mover la venta al mes nuevo, no quedarse pegada al mes viejo.
    if ($ventas.ContainsKey($clave)) {
      $finMes = $fa.AddDays(1 - $fa.Day).AddMonths(1).AddDays(-1)
      if ($ventas[$clave].arch -ge $finMes) { $congeladas++; continue }
    }

    $ventas[$clave] = [pscustomobject]@{
      arch    = $fArchivo
      cc      = $cc
      estado  = "$(Get-Col $r $COLS.estado)".Trim().ToUpperInvariant()
      motivo  = "$(Get-Col $r $COLS.motivo)".Trim()
      agenda  = $fa
      venta   = Get-Fecha (Get-Col $r $COLS.venta)
      cliCC   = "$(Get-Col $r $COLS.cliCC)".Trim()
      # NOMBRES CLIENTE ya viene con el apellido; APELLIDOS solo lo repite.
      cliNom  = $(
        $n = ("$(Get-Col $r $COLS.cliNom)" -replace '\s+',' ').Trim()
        if ($n) { $n } else { ("$(Get-Col $r $COLS.cliApe)" -replace '\s+',' ').Trim() }
      )
      ciudad  = "$(Get-Col $r $COLS.ciudad)".Trim()
      contrato= "$(Get-Col $r $COLS.contrato)".Trim()
      adic    = "$(Get-Col $r $COLS.adic)"
      ot      = $ot
      campana = "$(Get-Col $r $COLS.campana)".Trim()
      tel     = "$(Get-Col $r $COLS.tel)".Trim()
    }
    $tomadas++
  }
  Ok ("{0,-42} corte {1}  {2} filas del equipo" -f $f.Name, (Fecha-Archivo $f).ToString('yyyy-MM-dd'), $tomadas)
}

if ($sinFecha -gt 0)     { Avi "$sinFecha filas descartadas: FECHA AGENDA vacia o ilegible" }
if ($fueraCampana -gt 0) { Avi "$fueraCampana filas descartadas por campaña ajena a Hogar (ver avisos arriba)" }
if ($congeladas -gt 0)   { Ok  "$congeladas ventas de meses ya cerrados conservan el estado de su sabana de cierre" }
if ($ventas.Count -eq 0) { throw 'Ninguna venta del equipo quedo cargada' }
Ok "$($ventas.Count) ventas unicas (deduplicadas por N°OT)"

# ====================================================================== CORTE
$todas = $ventas.Values
if ($Corte) { $fCorte = Get-Fecha $Corte } else { $fCorte = ($todas | Where-Object { $_.estado -eq 'INSTALADO' } | Sort-Object agenda -Descending | Select-Object -First 1).agenda }
if (-not $fCorte) { throw 'No se pudo determinar la fecha de corte' }
Write-Host "`n== corte: $($fCorte.ToString('yyyy-MM-dd')) ==" -ForegroundColor Cyan

# ====================================================================== MESES
function Semanas-Mes([datetime]$primero){
  # Bloques que arrancan lunes y cierran domingo, recortados al mes.
  $ult = $primero.AddMonths(1).AddDays(-1)
  $sem = @(); $n = 0; $ini = $primero
  while ($ini -le $ult) {
    $offset = ([int]$ini.DayOfWeek + 6) % 7          # lunes = 0
    $fin = $ini.AddDays(6 - $offset)
    if ($fin -gt $ult) { $fin = $ult }
    $n++
    $sem += [pscustomobject]@{ n=$n; ini=$ini; fin=$fin; dias=(Dias-Habiles $ini $fin) }
    $ini = $fin.AddDays(1)
  }
  # El calendario de comision de agosto pega la primera semana corta con la siguiente.
  if ($primero.ToString('yyyy-MM') -eq '2026-08') {
    $sem = @(
      [pscustomobject]@{ n=1; ini=[datetime]'2026-08-01'; fin=[datetime]'2026-08-09'; dias=(Dias-Habiles ([datetime]'2026-08-01') ([datetime]'2026-08-09')) }
      [pscustomobject]@{ n=2; ini=[datetime]'2026-08-10'; fin=[datetime]'2026-08-16'; dias=(Dias-Habiles ([datetime]'2026-08-10') ([datetime]'2026-08-16')) }
      [pscustomobject]@{ n=3; ini=[datetime]'2026-08-17'; fin=[datetime]'2026-08-23'; dias=(Dias-Habiles ([datetime]'2026-08-17') ([datetime]'2026-08-23')) }
      [pscustomobject]@{ n=4; ini=[datetime]'2026-08-24'; fin=[datetime]'2026-08-31'; dias=(Dias-Habiles ([datetime]'2026-08-24') ([datetime]'2026-08-31')) }
    )
  }
  return $sem
}

$mkCorte = $fCorte.ToString('yyyy-MM')

# Ventas agendadas mas alla del mes del corte (ej. un agendamiento para
# septiembre mientras agosto todavia esta abierto) no abren una pestaña de
# mes nueva: se cuentan dentro del mes en curso hasta que ese mes cierre.
# Por eso el tope de $clavesMes es $mkCorte, no el mes mas futuro que
# aparezca en la sabana.
$clavesMes = @($todas | ForEach-Object { $_.agenda.ToString('yyyy-MM') } | Sort-Object -Unique)
$clavesMes = @($clavesMes | Where-Object { $_ -ge '2026-07' -and $_ -le $mkCorte })   # el portal muestra julio y agosto

$mesesJson = [ordered]@{}
$mesesInfo = @{}
$nombreMes = @{ '07'='Julio'; '08'='Agosto'; '09'='Septiembre'; '10'='Octubre'; '11'='Noviembre'; '12'='Diciembre' }

foreach ($mk in $clavesMes) {
  $primero = [datetime]::ParseExact("$mk-01",'yyyy-MM-dd',$null)
  $ultimo  = $primero.AddMonths(1).AddDays(-1)
  $cerrado = $fCorte -ge $ultimo
  $hasta   = if ($cerrado) { $ultimo } else { $fCorte }

  $tot = Dias-Habiles $primero $ultimo
  $tr  = Dias-Habiles $primero $hasta
  if ($tr -lt 1) { $tr = 1 }

  $sem = Semanas-Mes $primero
  $fest = @($FESTIVOS.Keys | Where-Object { $_ -like "$mk-*" } | Sort-Object | ForEach-Object { @{ f=$_; n=$FESTIVOS[$_] } })

  $mesesInfo[$mk] = @{ primero=$primero; ultimo=$ultimo; cerrado=$cerrado; sem=$sem; tot=$tot; tr=$tr }
  $mesesJson[$mk] = [ordered]@{
    nombre   = "$($nombreMes[$primero.ToString('MM')]) $($primero.Year)"
    corto    = $nombreMes[$primero.ToString('MM')]
    cerrado  = $cerrado
    ini      = $primero.ToString('yyyy-MM-dd')
    fin      = $ultimo.ToString('yyyy-MM-dd')
    hab      = [ordered]@{ tot=$tot; tr=$tr; rest=[math]::Max(0,$tot-$tr) }
    festivos = $fest
    # El bono semanal arranca en agosto de 2026 (ver COMISIONES AGOSTO.pdf).
    bonoSem  = ($mk -ge '2026-08')
    semanas  = @($sem | ForEach-Object {
                 [ordered]@{ n=$_.n; ini=$_.ini.ToString('yyyy-MM-dd'); fin=$_.fin.ToString('yyyy-MM-dd')
                             dias=$_.dias; abierta=(-not $cerrado -and $fCorte -le $_.fin -and $fCorte -ge $_.ini)
                             futura=($fCorte -lt $_.ini) } })
  }
  Ok "$mk  habiles $tr/$tot  semanas $($sem.Count)  cerrado=$cerrado"
}

# =================================================================== AGENTES
Write-Host "`n== agentes ==" -ForegroundColor Cyan
$agentesJson = @()

foreach ($a in ($asesores | Sort-Object nombre)) {
  $cc  = $a.cedula.Trim()
  $mis = @($todas | Where-Object { $_.cc -eq $cc })
  $mJson = [ordered]@{}

  foreach ($mk in $clavesMes) {
    $info = $mesesInfo[$mk]
    $esq  = Esquema $mk $a.tipo

    # El mes en curso (el del corte) absorbe cualquier agenda mas futura
    # (ej. una instalacion agendada para septiembre mientras agosto sigue
    # abierto): todavia no existe una pestaña para ese mes, asi que cuenta
    # aqui hasta que el mes en curso cierre. Los meses ya cerrados solo
    # toman su propio mes exacto.
    $delMes = if ($mk -eq $mkCorte) {
      @($mis | Where-Object { $_.agenda.ToString('yyyy-MM') -ge $mk })
    } else {
      @($mis | Where-Object { $_.agenda.ToString('yyyy-MM') -eq $mk })
    }
    if ($delMes.Count -eq 0) { continue }

    $inst = @($delMes | Where-Object { $_.estado -eq 'INSTALADO' })

    # -------- contratos digitales
    $dig = @($delMes | Where-Object { (Norm $_.contrato) -eq 'DIGITAL' }).Count
    $digPct = if ($delMes.Count) { [math]::Round(100.0*$dig/$delMes.Count,1) } else { 0 }

    # -------- OTT y otros adicionales (sobre ventas instaladas)
    $accOtt = @{}; $accVas = @{}; $nOtt = 0
    foreach ($v in $inst) {
      foreach ($t in ($v.adic -split ',')) {
        $t = (Norm $t) -replace ' ',''
        if (-not $t) { continue }
        if ($CAT_OTT.ContainsKey($t))     { $k=$CAT_OTT[$t]; if(-not $accOtt[$k]){$accOtt[$k]=0}; $accOtt[$k]++; $nOtt++ }
        elseif ($CAT_VAS.ContainsKey($t)) { $k=$CAT_VAS[$t]; if(-not $accVas[$k]){$accVas[$k]=0}; $accVas[$k]++ }
        else { Avi "adicional no clasificado: '$t' ($($a.nombre))" }
      }
    }

    # -------- semanas
    $semJson = @()
    foreach ($s in $info.sem) {
      $n = @($inst | Where-Object { $_.agenda -ge $s.ini -and $_.agenda -le $s.fin }).Count
      $p = Piso $esq.sem $n
      $semJson += [ordered]@{ n=$s.n; inst=$n; piso=$p.piso; tarifa=$p.tarifa; com=$p.com }
    }

    # -------- racha de ventas y Personal Best (dias completos, sin el dia del
    # corte: los estados de instalacion llegan con un dia de rezago y contarlo
    # rompería rachas que en realidad siguen vivas)
    $diaCompleto = if ($info.cerrado) { $info.ultimo } else { Dia-HabilAnterior $fCorte }
    $diasMes = @()
    if ($diaCompleto -ge $info.primero) {
      $d = $info.primero
      while ($d -le $diaCompleto) {
        if (Es-Habil $d) {
          $n = @($inst | Where-Object { $_.agenda.Date -eq $d.Date }).Count
          $diasMes += ,[pscustomobject]@{ f=$d; n=$n }
        }
        $d = $d.AddDays(1)
      }
    }

    # Racha = dias consecutivos con al menos 1 instalada, contando hacia atras
    # desde el ultimo dia completo. El comodin perdona UN dia flojo sin cortar
    # la racha (pero ese dia no suma), y solo se puede usar una vez por mes.
    $rachaActual = 0; $saltos = 0
    for ($i = $diasMes.Count-1; $i -ge 0; $i--) {
      if ($diasMes[$i].n -gt 0) { $rachaActual++ }
      elseif ($saltos -lt 1) { $saltos++ }
      else { break }
    }
    $mejorRacha = 0
    for ($ini2 = $diasMes.Count-1; $ini2 -ge 0; $ini2--) {
      $r = 0; $s = 0
      for ($i = $ini2; $i -ge 0; $i--) {
        if ($diasMes[$i].n -gt 0) { $r++ }
        elseif ($s -lt 1) { $s++ }
        else { break }
      }
      if ($r -gt $mejorRacha) { $mejorRacha = $r }
    }

    $pb = $null
    if ($diasMes.Count -gt 0) {
      $record    = ($diasMes | Measure-Object n -Maximum).Maximum
      $recordDia = ($diasMes | Where-Object { $_.n -eq $record } | Select-Object -First 1)
      $ayerDia   = $diasMes[-1]
      $pb = [ordered]@{
        ayer = $ayerDia.n; ayerFecha = $ayerDia.f.ToString('yyyy-MM-dd')
        record = $record;  recordFecha = $recordDia.f.ToString('yyyy-MM-dd')
        iguala = ($ayerDia.n -ge $record)
      }
    }

    # -------- estados y pendientes por revisar
    $estados = @($delMes | Group-Object estado | Sort-Object Count -Descending |
                 ForEach-Object { ,@($_.Name, $_.Count) })

    $pend = @()
    foreach ($v in ($delMes | Where-Object { $_.estado -ne 'INSTALADO' } | Sort-Object agenda)) {
      $mot = $v.motivo
      if (-not $mot -or (Norm $mot) -eq (Norm $v.estado) -or $mot -eq '0') { $mot = '' }
      $pend += [ordered]@{
        est=$v.estado; mot=$mot; cc=$v.cliCC; nom=$v.cliNom; ciu=$v.ciudad
        ag=$v.agenda.ToString('yyyy-MM-dd'); ot=$v.ot; tel=$v.tel
      }
    }

    # -------- proyeccion y comision
    $iTot = $inst.Count
    $iCorte = @($inst | Where-Object { $_.agenda -le $fCorte }).Count
    if ($info.cerrado) {
      $proy = [double]$iTot
    } else {
      $proy = [math]::Round($iCorte * ($info.tot / $info.tr), 1)
      if ($proy -lt $iTot) { $proy = [double]$iTot }   # nunca proyectar por debajo de lo ya logrado
    }

    $meta   = $esq.mes[0][0]
    $pMes   = Piso $esq.mes $iTot
    $pProy  = Piso $esq.mes $proy
    $extra = 0
    if ($mesesJson[$mk].bonoSem) { foreach ($s in $semJson) { $extra += $s.com } }

    $ritmo  = [math]::Round($iCorte / $info.tr, 2)
    $rest   = [math]::Max(0, $info.tot - $info.tr)

    # cuanto falta para el siguiente escalon del mes
    $sig = $null
    foreach ($e in $esq.mes) { if ($proy -lt $e[0]) { $sig = $e; break } }
    $req = $null; $esf = $null
    if ($sig -and $rest -gt 0) {
      $faltan = $sig[0] - $iCorte
      $req = [math]::Round($faltan / $rest, 2)
      if ($ritmo -gt 0) { $esf = [math]::Round(($req/$ritmo) - 1, 3) }
    }

    $mJson[$mk] = [ordered]@{
      esq    = $esq.nombre
      inst   = $iTot
      instC  = $iCorte
      gest   = $delMes.Count
      dig    = $dig
      digPct = $digPct
      ott    = $nOtt
      ottDet = @($accOtt.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object { ,@($_.Key,$_.Value) })
      vasDet = @($accVas.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object { ,@($_.Key,$_.Value) })
      meta   = $meta
      proy   = $proy
      cumpl  = [math]::Round($proy/$meta,3)
      cumplH = [math]::Round($iTot/$meta,3)
      piso   = $pProy.piso
      tarifa = $pProy.tarifa
      comBase= [math]::Round($proy * $pProy.tarifa)
      comHoy = $pMes.com
      extra  = $extra
      total  = [math]::Round($proy * $pProy.tarifa) + $extra
      # Comisión ya asegurada con lo REALMENTE instalado (no la proyección):
      # base sobre instaladas reales + el extra bono, que ya se calcula sobre
      # instaladas reales de cada semana. Nunca es mayor que 'total'.
      garantizada = $pMes.com + $extra
      racha  = [ordered]@{ actual=$rachaActual; mejor=$mejorRacha; comodinUsado=($saltos -gt 0) }
      pb     = $pb
      ritmo  = $ritmo
      req    = $req
      esf    = $esf
      sigEsc = if ($sig) { @($sig[0],$sig[1]) } else { $null }
      sem    = $semJson
      estados= $estados
      pend   = $pend
      oficial= if ($mk -eq '2026-07' -and $oficial.ContainsKey($cc)) { $oficial[$cc] } else { $null }
    }

    if ($iTot -gt 0 -and $dig -eq 0) { Avi "$($a.nombre) ${mk}: $iTot instaladas y 0 contratos digitales" }
  }

  if ($mJson.Count -eq 0) { Avi "$($a.nombre) no tiene ninguna venta en el periodo" }

  $agentesJson += [ordered]@{
    cc     = $cc
    nombre = $a.nombre.Trim()
    ap2    = (Norm (Ap2 $a.nombre))
    tipo   = $a.tipo
    equipo = $ESQ_TIPO[$a.tipo].nombre    # su tipo base; el del mes va en m[mes].esq
    ing    = if ($a.ingreso) { (Get-Fecha $a.ingreso).ToString('yyyy-MM-dd') } else { $null }
    m      = $mJson
  }
  $u = $mJson[$clavesMes[-1]]
  Ok ("{0,-34} {1,3} inst  {2,3}% dig  {3,3} OTT" -f $a.nombre, $(if($u){$u.inst}else{0}), $(if($u){$u.digPct}else{0}), $(if($u){$u.ott}else{0}))
}

# ==================================================================== SALIDA
# El esquema va indexado por mes: en agosto cambia para todos, y el portal
# tiene que poder mostrar julio con las reglas con las que julio se cerro.
$esqJson = [ordered]@{}
foreach ($mk in $clavesMes) {
  $esqJson[$mk] = [ordered]@{}
  foreach ($t in $ESQ_TIPO.Keys) { $esqJson[$mk][$t] = Esquema $mk $t }
  $uni = ((Esquema $mk 'OUTBOUND').nombre -eq (Esquema $mk 'BLASTER').nombre)
  $esqJson[$mk]['unificado'] = $uni
  if ($uni) { Ok "$mk usa un solo esquema para todo el equipo: $((Esquema $mk 'OUTBOUND').nombre)" }
}

$doc = [ordered]@{
  corte    = $fCorte.ToString('yyyy-MM-dd')
  generado = (Get-Date).ToString('yyyy-MM-dd HH:mm')
  campana  = 'Claro Hogar · Barranquilla'
  sup      = [ordered]@{
    cc=$sup.cedula.Trim(); nombre=$sup.nombre.Trim(); ap2=(Norm (Ap2 $sup.nombre))
  }
  esquema  = $esqJson
  meses    = $mesesJson
  agentes  = $agentesJson
}

$json = $doc | ConvertTo-Json -Depth 12 -Compress
[IO.File]::WriteAllText($Salida, $json, (New-Object Text.UTF8Encoding $false))

Write-Host "`n== resumen ==" -ForegroundColor Cyan
Write-Host ("  {0} agentes · {1} ventas · corte {2}" -f $agentesJson.Count, $ventas.Count, $doc.corte)
Write-Host ("  {0:N0} KB -> {1}" -f ((Get-Item $Salida).Length/1KB), $Salida)
if ($avisos.Count)  { Write-Host "  $($avisos.Count) avisos"  -ForegroundColor Yellow }
if ($errores.Count) { Write-Host "  $($errores.Count) ERRORES — revisar antes de publicar" -ForegroundColor Red; exit 1 }
Write-Host "  sin errores`n" -ForegroundColor Green
