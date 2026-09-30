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

# Meses que YA tienen metas de comision confirmadas. Un mes que no aparezca
# aqui no tiene esquema: se muestra con instaladas y proyeccion, pero sin piso,
# tarifa ni comision inventados.
$MESES_CON_ESQUEMA = @('2026-07','2026-08','2026-09')

# --- SEPTIEMBRE 2026: modelo NUEVO, aprobado por nomina (tablas ACCESOS 6 HORAS)
# Cambia respecto a jul/ago en dos cosas:
#  1) Vuelven TRES skills distintos (antes ago unificaba en Omnicanal).
#  2) Ya NO se paga tarifa por instalada, sino una BONIFICACION PLANA por el piso
#     mas alto de instaladas alcanzado (no se acumulan pisos; por debajo del piso
#     1 = $0). No hay bono semanal en septiembre.
# escalones = [instaladas_desde, bono_plano]. Confirmado con Wilmer 11/09/2026.
$ESQ_SEP = [ordered]@{
  BLASTER   = [ordered]@{ nombre='Blaster';   bono=$true; mes=@(@(30,400000),@(35,800000),@(40,2000000)); sem=@() }
  OUTBOUND  = [ordered]@{ nombre='Outbound';  bono=$true; mes=@(@(20,400000),@(25,1000000),@(35,2000000)); sem=@() }
  OMNICANAL = [ordered]@{ nombre='Omnicanal'; bono=$true; mes=@(@(35,400000),@(40,800000),@(45,2000000)); sem=@() }
}
# Clasificacion de skill valida para SEPTIEMBRE (por cedula). Se mantiene aparte
# de la columna 'tipo' del roster a proposito: 'tipo' es el esquema con el que se
# cerro JULIO y no se puede tocar sin restatear un mes ya pagado. Un mes futuro
# con reclasificacion de skills se resuelve agregando su propio mapa aqui.
$SKILL_SEP = @{
  '1042854178'='BLASTER'; '1042994663'='BLASTER'; '1123891335'='BLASTER'; '1143232881'='BLASTER'
  '1143445082'='BLASTER'; '1044628010'='BLASTER'; '1143154495'='BLASTER'; '1140847397'='BLASTER'
  '1102825797'='BLASTER'; '1140828545'='BLASTER'
  '1066864972'='OUTBOUND'; '1001997640'='OUTBOUND'; '22550093'='OUTBOUND'; '1043447673'='OUTBOUND'
  '1001995827'='OMNICANAL'; '1041890641'='OMNICANAL'; '1044213250'='OMNICANAL'
  '1007541668'='OMNICANAL'; '1193561818'='OMNICANAL'
}

# Skill que aplica a un asesor en un mes dado. Septiembre usa $SKILL_SEP; los
# meses anteriores usan el 'tipo' del roster (el esquema con que cerraron).
function SkillMes([string]$mk, [string]$cc, [string]$tipo) {
  if ($mk -eq '2026-09' -and $SKILL_SEP.ContainsKey($cc)) { return $SKILL_SEP[$cc] }
  return $tipo
}

function Esquema([string]$mk, [string]$tipo, [string]$cc='') {
  if ($MESES_CON_ESQUEMA -notcontains $mk) { return $null }
  if ($mk -eq '2026-09') {
    $sk = SkillMes $mk $cc $tipo
    if ($ESQ_SEP.Contains($sk)) { return $ESQ_SEP[$sk] } else { return $ESQ_SEP.BLASTER }
  }
  if ($mk -ge $MES_UNIFICADO) { return $ESQ_TIPO.BLASTER }
  return $ESQ_TIPO[$tipo]
}
# Piso alcanzado y su valor. Para jul/ago (tarifa por instalada) 'com' = ventas x
# tarifa. Para septiembre (bono plano) 'tarifa' ES el bono del piso y 'com' = ese
# mismo bono (no se multiplica por instaladas), respetando "piso mas alto, sin
# acumular". Por debajo del piso 1, piso=0 y com=0.
function Piso($escalones,[double]$ventas,[bool]$bono=$false){
  $piso = 0; $tarifa = 0
  for ($i=0; $i -lt $escalones.Count; $i++) {
    if ($ventas -ge $escalones[$i][0]) { $piso = $i+1; $tarifa = $escalones[$i][1] }
  }
  $com = if ($bono) { $tarifa } else { [math]::Round($ventas * $tarifa) }
  return @{ piso = $piso; tarifa = $tarifa; com = $com }
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
  # La sabana de septiembre 2026 exporta la columna de estado con el encabezado
  # 'RECHAZADO' (mismo contenido: INSTALADO/AGENDADO/RECHAZADO/OT CANCELADA/NO
  # INSTALADO). Se busca 'ESTADO DIGITACION' primero; solo se cae a 'RECHAZADO'
  # cuando la primera no existe, para no confundirla en sabanas que traigan ambas.
  estado  = @('ESTADO DIGITACION','RECHAZADO')
  motivo  = @('MOTIVO DE INCUMPLIMIENTO')
  agenda  = @('FECHA AGENDA','FECHA DE AGENDA')
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
  sup     = @('SUPERVISOR')
  # Cargo fijo mensual del servicio vendido: el CFM con que se valora la
  # facturación que representa el tiempo perdido (pestaña Auxiliares).
  cfm     = @('VALOR SERV FINAL')
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
$ojtAjenas    = @{}     # ventas de la campaña OJT de asesores que no son del roster

foreach ($f in ($archivos | Sort-Object @{ Expression = { Fecha-Archivo $_ } })) {
  $fArchivo = Fecha-Archivo $f
  # El delimitador cambia entre exportes: las sabanas viejas vienen con ';', la
  # de septiembre 2026 en adelante viene separada por TAB. Se detecta con la
  # primera linea (mas TABs que ';' -> TSV) en vez de asumir uno fijo, que era
  # lo que dejaba la sabana de septiembre en 0 filas ("falta la columna ...").
  $primera = Get-Content $f.FullName -TotalCount 1 -Encoding UTF8
  $delim = if ((($primera -split "`t").Count - 1) -gt (($primera -split ';').Count - 1)) { "`t" } else { ';' }
  $filas = Import-Csv $f.FullName -Delimiter $delim -Encoding UTF8
  if ($filas.Count -eq 0) { Avi "$($f.Name) esta vacio"; continue }

  foreach ($k in @('cc','estado','agenda','contrato','adic')) {
    if ($null -eq (Get-Col $filas[0] $COLS[$k])) { Err "$($f.Name): falta la columna $($COLS[$k][0])" }
  }

  $tomadas = 0
  foreach ($r in $filas) {
    $cc = "$(Get-Col $r $COLS.cc)".Trim()
    if (-not $porCC.ContainsKey($cc)) {                      # asesor de otro equipo
      # ...salvo las ventas de la campaña OJT: esas cuentan TODAS para el
      # total OJT de la campaña, sea cual sea el supervisor (regla de Wilmer).
      $campO = "$(Get-Col $r $COLS.campana)".Trim().ToUpperInvariant()
      $faO   = Get-Fecha (Get-Col $r $COLS.agenda)
      if ($campO -match '^HOGAR.*OJT' -and $faO) {
        $otO = "$(Get-Col $r $COLS.ot)".Trim()
        $kO  = if ($otO -and $otO -ne '0') { "OT$otO" } else { "X$cc|$($faO.ToString('yyyyMMdd'))|$("$(Get-Col $r $COLS.cliCC)".Trim())" }
        $ojtAjenas[$kO] = [pscustomobject]@{
          cc = $cc; nombre = ("$(Get-Col $r $COLS.asesor)" -replace '\s+',' ').Trim()
          estado = "$(Get-Col $r $COLS.estado)".Trim().ToUpperInvariant(); agenda = $faO
          sup = ("$(Get-Col $r $COLS.sup)" -replace '\s+',' ').Trim() }
      }
      continue
    }

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
      cfm     = $( $x = 0.0; [void][double]::TryParse(("$(Get-Col $r $COLS.cfm)" -replace '[^\d.]',''), [Globalization.NumberStyles]::Float, [Globalization.CultureInfo]::InvariantCulture, [ref]$x); $x )
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
    # El bono semanal existio SOLO en agosto de 2026 (ver COMISIONES AGOSTO.pdf).
    # Septiembre cambio a bono mensual por piso, sin componente semanal
    # (confirmado con Wilmer 11/09/2026). Si vuelve, agregar el mes aqui.
    bonoSem  = ($mk -eq '2026-08')
    tieneEsquema = ($MESES_CON_ESQUEMA -contains $mk)
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

  # Un asesor retirado sigue en el roster para que sus ventas de los meses en
  # que estuvo activo NO desaparezcan (borrarlo del roster borraria su historia:
  # ej. 69 instaladas de agosto). Su fecha de retiro solo evita que reaparezca en
  # meses POSTERIORES a su salida por ventas colgadas (ej. una OT reagendada por
  # su reemplazo a un mes en el que el ya no estaba). El mes de la salida cuenta
  # completo: una venta suya que se instala despues de su ultimo dia igual es
  # suya (confirmado con Wilmer el 09/09/2026).
  $fRetiro  = if ($a.retiro) { Get-Fecha $a.retiro } else { $null }
  $mkRetiro = if ($fRetiro) { $fRetiro.ToString('yyyy-MM') } else { $null }

  foreach ($mk in $clavesMes) {
    if ($mkRetiro -and $mk -gt $mkRetiro) { continue }
    $info = $mesesInfo[$mk]
    $esq  = Esquema $mk $a.tipo $cc
    $skillMes = SkillMes $mk $cc $a.tipo

    # El mes en curso (el del corte) absorbe cualquier agenda mas futura
    # (ej. una instalacion agendada para septiembre mientras agosto sigue
    # abierto): todavia no existe una pestaña para ese mes, asi que cuenta
    # aqui hasta que el mes en curso cierre. Los meses ya cerrados solo
    # toman su propio mes exacto.
    # El @() tiene que envolver TODO el if/else, no cada rama por separado: si
    # la rama ejecutada emite un solo objeto (un asesor con exactamente 1
    # venta ese mes), PowerShell "desenreda" el resultado del if/else a un
    # escalar sin importar que la rama interna ya estuviera en @(). Sobre un
    # escalar, .Count no existe (da $null, no 1) y $null -eq 0 es $false, asi
    # que el filtro de "sin ventas este mes" tampoco lo detecta: el mes queda
    # con datos a medias (gest/digPct mal) en silencio. Encontrado con Jesus
    # y Martha en septiembre, ambos con exactamente 1 venta ese mes.
    $delMes = @(if ($mk -eq $mkCorte) {
      $mis | Where-Object { $_.agenda.ToString('yyyy-MM') -ge $mk }
    } else {
      $mis | Where-Object { $_.agenda.ToString('yyyy-MM') -eq $mk }
    })
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
      if ($esq -and -not $esq.bono -and $esq.sem.Count) {
        $p = Piso $esq.sem $n
        $semJson += [ordered]@{ n=$s.n; inst=$n; piso=$p.piso; tarifa=$p.tarifa; com=$p.com }
      } else {
        # Sin bono semanal (septiembre: modelo de bono mensual por piso; o un mes
        # sin esquema): se muestran las instaladas de la semana, sin comision.
        $semJson += [ordered]@{ n=$s.n; inst=$n; piso=$null; tarifa=$null; com=$null }
      }
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

    $ritmo  = [math]::Round($iCorte / $info.tr, 2)
    $rest   = [math]::Max(0, $info.tot - $info.tr)

    if ($esq -and $esq.bono) {
      # ----- SEPTIEMBRE: bono plano por piso mas alto de instaladas (no acumula,
      # no hay tarifa por instalada, no hay bono semanal). tarifa/comBase quedan
      # en null: son conceptos del modelo viejo que el portal oculta.
      $meta   = $esq.mes[0][0]
      $pMes   = Piso $esq.mes $iTot $true    # bono asegurado con instaladas reales
      $pProy  = Piso $esq.mes $proy $true    # bono proyectado al cierre

      $sig = $null
      foreach ($e in $esq.mes) { if ($proy -lt $e[0]) { $sig = $e; break } }

      $datosComision = [ordered]@{
        esq    = $esq.nombre
        meta   = $meta
        cumpl  = [math]::Round($proy/$meta,3)
        cumplH = [math]::Round($iTot/$meta,3)
        piso   = $pProy.piso
        tarifa = $null
        comBase= $null
        comHoy = $pMes.com
        extra  = 0
        total  = $pProy.com          # bono del piso proyectado
        garantizada = $pMes.com      # bono del piso ya asegurado con instaladas reales
        sigEsc = if ($sig) { @($sig[0],$sig[1]) } else { $null }
      }
    } elseif ($esq) {
      $meta   = $esq.mes[0][0]
      $pMes   = Piso $esq.mes $iTot
      $pProy  = Piso $esq.mes $proy
      $extra = 0
      if ($mesesJson[$mk].bonoSem) { foreach ($s in $semJson) { $extra += $s.com } }

      # cuanto falta para el siguiente escalon del mes
      $sig = $null
      foreach ($e in $esq.mes) { if ($proy -lt $e[0]) { $sig = $e; break } }
      $req = $null; $esf = $null
      if ($sig -and $rest -gt 0) {
        $faltan = $sig[0] - $iCorte
        $req = [math]::Round($faltan / $rest, 2)
        if ($ritmo -gt 0) { $esf = [math]::Round(($req/$ritmo) - 1, 3) }
      }

      $datosComision = [ordered]@{
        esq    = $esq.nombre
        meta   = $meta
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
        sigEsc = if ($sig) { @($sig[0],$sig[1]) } else { $null }
      }
    } else {
      # Sin metas de comision confirmadas para este mes todavia: se muestran
      # instaladas y proyeccion (mas abajo), pero nada de piso/tarifa/comision
      # inventado. El portal reconoce 'meta:null' y oculta esa parte sola.
      $datosComision = [ordered]@{
        esq=$null; meta=$null; cumpl=$null; cumplH=$null; piso=$null; tarifa=$null
        comBase=$null; comHoy=$null; extra=0; total=$null; garantizada=$null; sigEsc=$null
      }
    }

    $mJson[$mk] = [ordered]@{} + $datosComision + [ordered]@{
      skill  = $skillMes    # esquema que aplica ese mes (clave en D.esquema[mk])
      inst   = $iTot
      instC  = $iCorte
      gest   = $delMes.Count
      dig    = $dig
      digPct = $digPct
      ott    = $nOtt
      ottDet = @($accOtt.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object { ,@($_.Key,$_.Value) })
      vasDet = @($accVas.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object { ,@($_.Key,$_.Value) })
      proy   = $proy
      racha  = [ordered]@{ actual=$rachaActual; mejor=$mejorRacha; comodinUsado=($saltos -gt 0) }
      pb     = $pb
      ritmo  = $ritmo
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
    retiro = if ($fRetiro) { $fRetiro.ToString('yyyy-MM-dd') } else { $null }
    m      = $mJson
  }
  $u = $mJson[$clavesMes[-1]]
  Ok ("{0,-34} {1,3} inst  {2,3}% dig  {3,3} OTT" -f $a.nombre, $(if($u){$u.inst}else{0}), $(if($u){$u.digPct}else{0}), $(if($u){$u.ott}else{0}))
}

# ==========================================================================
#  AUXILIARES  (tiempos del día, desde el Power BI "Informe de Tiempos CXD")
#
#  Se consulta el reporte publicado en la web con la misma API que usa el
#  visor. Si el Power BI no responde, el portal sale igual, sin la pestaña de
#  auxiliares: los tiempos nunca pueden tumbar la publicación de las ventas.
#
#  Reglas del turno (las que fija la operación):
#     turno 6 h · break permitido 20 min · baño permitido 5 min
#  Tiempo perdido del día = exceso de break + exceso de baño + Pausa +
#  Pausa Call Out + Pausa Working. Coaching, ACW, incidente técnico y pausa
#  del supervisor NO cuentan: o los manda la operación o son parte del
#  trabajo de la llamada.
#
#  Ventas que eso representa: cada asesor tiene su propio ritmo (INSTALADAS
#  del mes por FECHA AGENDA / horas productivas del mes = en llamada + disponible).
#  Los minutos perdidos se multiplican por ESE ritmo, no por uno del equipo:
#  a quien vende más, cada minuto perdido le cuesta más.
# ==========================================================================
Write-Host "`n== auxiliares ==" -ForegroundColor Cyan

$AUX_TURNO = 360; $AUX_BREAK = 20; $AUX_BANO = 5
$PBI_KEY   = 'e18997ed-2d66-4158-b6ab-54168d282057'
$PBI_HOST  = 'https://wabi-south-central-us-c-primary-api.analysis.windows.net'
$PBI_MED   = @('Horas_conexion_agente','Break','Baño','Pausa Call Out','Pausa Working','Coaching',
               'ACW','Pausa','Incidente Técnico','Pausado por supervisor','Disponible','En Llamada',
               '% Ocupación','% Adherencia','Hora_Inicio','Hora_Salida')

function Pbi-Post([string]$ruta, $cuerpo, [switch]$crudo){
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  $req = [Net.HttpWebRequest]::Create($PBI_HOST + $ruta)
  $req.AutomaticDecompression = [Net.DecompressionMethods]::GZip -bor [Net.DecompressionMethods]::Deflate
  $req.Headers.Add('X-PowerBI-ResourceKey', $PBI_KEY)
  $req.Timeout = 90000
  if ($null -ne $cuerpo) {
    $req.Method = 'POST'; $req.ContentType = 'application/json'
    $b = [Text.Encoding]::UTF8.GetBytes(($cuerpo | ConvertTo-Json -Depth 40 -Compress))
    $s = $req.GetRequestStream(); $s.Write($b,0,$b.Length); $s.Close()
  }
  $resp = $req.GetResponse()
  $sr = [IO.StreamReader]::new($resp.GetResponseStream(), [Text.Encoding]::UTF8)
  $txt = $sr.ReadToEnd(); $sr.Close(); $resp.Close()
  if ($crudo) { return $txt }
  # PowerShell 5.1 no acepta claves que solo difieren en mayúsculas
  # ('nextRefreshTime' / 'NextRefreshTime'): se quitan antes de convertir.
  $txt = [regex]::Replace($txt, '"NextRefreshTime"\s*:\s*("[^"]*"|null|[\d.]+)\s*,?', '')
  return ($txt | ConvertFrom-Json)
}

$auxiliares = [ordered]@{}
$auxMeta    = $null
# Solo el headcount activo del mes del corte: quien se retiró antes no se consulta.
$auxIniMes  = $fCorte.AddDays(1 - $fCorte.Day)
$auxActivos = @($asesores | Where-Object { -not $_.retiro -or (Get-Fecha $_.retiro) -ge $auxIniMes })
try {
  # Del modelo solo hace falta el id: se lee con una expresión regular en vez
  # de convertir todo el JSON, que trae claves duplicadas por mayúsculas.
  $crudoM = Pbi-Post "/public/reports/$PBI_KEY/modelsAndExploration?preferReadOnlySession=true" $null -crudo
  if ($crudoM -notmatch '"models"\s*:\s*\[\s*\{[^{}]*?"id"\s*:\s*(\d+)') { throw 'no se encontró el id del modelo' }
  $modelId = [long]$Matches[1]

  $sel = @(
    [ordered]@{ Column = [ordered]@{ Expression=@{SourceRef=@{Source='p'}}; Property='documento_id' }; Name='cc' },
    [ordered]@{ Column = [ordered]@{ Expression=@{SourceRef=@{Source='c'}}; Property='Date' };         Name='f' }
  )
  foreach ($m in $PBI_MED) { $sel += [ordered]@{ Measure=[ordered]@{ Expression=@{SourceRef=@{Source='m'}}; Property=$m }; Name=$m } }
  $consulta = [ordered]@{
    Version = 2
    From    = @(@{Name='p';Entity='Dim_Planta_Activa';Type=0}, @{Name='c';Entity='Dim_Calendario';Type=0}, @{Name='m';Entity='Tabla_Medidas';Type=0})
    Select  = $sel
    Where   = @(@{ Condition = @{ In = @{
                 Expressions = @(@{ Column = @{ Expression=@{SourceRef=@{Source='p'}}; Property='documento_id' } })
                 Values = @($auxActivos | ForEach-Object { ,@(@{ Literal = @{ Value = "'$($_.cedula.Trim())'" } }) }) } } })
  }
  $cuerpo = [ordered]@{
    version = '1.0.0'; cancelQueries = @(); modelId = $modelId
    queries = @(@{ Query = @{ Commands = @(@{ SemanticQueryDataShapeCommand = [ordered]@{
      Query = $consulta
      Binding = [ordered]@{ Primary = @{ Groupings = @(@{ Projections = @(0..($sel.Count-1)) }) }
                            DataReduction = @{ DataVolume = 4; Primary = @{ Window = @{ Count = 30000 } } }; Version = 1 }
    } }) } })
  }
  $r = Pbi-Post '/public/reports/querydata?synchronous=true' $cuerpo

  # --- Decodificar el formato comprimido del visor: cada fila solo trae las
  #     celdas que cambian (R = se repite la anterior, Ø = vacía), y cada
  #     medida con formato dinámico ocupa DOS columnas (valor + texto).
  $data  = $r.results[0].result.data
  $desc  = @{}; foreach ($s in $data.descriptor.Select) { $desc[$s.Value] = $s.Name }
  $ds    = $data.dsr.DS[0]
  $dicts = $ds.ValueDicts
  $ph    = $ds.PH[0]
  $filasPbi = $ph.($ph.PSObject.Properties.Name | Where-Object { $_ -like 'DM*' } | Select-Object -First 1)
  $esq = $null; $cur = $null; $diasLeidos = 0; $fueraRango = 0
  foreach ($row in $filasPbi) {
    if ($row.S) { $esq = @($row.S); $cur = New-Object object[] $esq.Count }
    $repite = if ($null -ne $row.R) { [int]$row.R } else { 0 }
    $vacias = if ($null -ne $row.'Ø') { [int]$row.'Ø' } else { 0 }
    $C = @($row.C); $ci = 0
    for ($i=0; $i -lt $esq.Count; $i++) {
      if (($repite -shr $i) -band 1) { continue }
      if (($vacias -shr $i) -band 1) { $cur[$i] = $null; continue }
      $cur[$i] = if ($ci -lt $C.Count) { $C[$ci] } else { $null }; $ci++
    }
    $o = @{}
    for ($i=0; $i -lt $esq.Count; $i++) {
      $nom = $desc[$esq[$i].N]; if (-not $nom) { continue }
      $v = $cur[$i]
      if ($esq[$i].DN -and ($v -is [int] -or $v -is [long])) { $v = $dicts.($esq[$i].DN)[[int]$v] }
      $o[$nom] = $v
    }
    $cc = "$($o['cc'])"
    if (-not $porCC.ContainsKey($cc) -or $null -eq $o['f']) { continue }
    $fecha = ([datetime]'1970-01-01').AddMilliseconds([double]$o['f']).ToString('yyyy-MM-dd')
    $min = @{}
    # Hora de inicio y salida: vienen como fecha-hora de Excel ('1899-12-30T19:24:49');
    # se deja solo HH:mm en hora militar.
    $hIni = if ("$($o['Hora_Inicio'])" -match 'T(\d{2}:\d{2})') { $Matches[1] } else { '' }
    $hFin = if ("$($o['Hora_Salida'])" -match 'T(\d{2}:\d{2})') { $Matches[1] } else { '' }
    foreach ($m in $PBI_MED) {
      if ($m -like 'Hora_*') { continue }
      $v = $o[$m]; $x = 0.0
      if ($null -ne $v -and "$v" -ne '') { [void][double]::TryParse("$v", [Globalization.NumberStyles]::Float, [Globalization.CultureInfo]::InvariantCulture, [ref]$x) }
      # Las de tiempo vienen en horas; las de % vienen como fracción (0,84 = 84 %).
      $min[$m] = if ($m -like '%*') { [math]::Round($x * 100, 1) } else { [math]::Round($x * 60, 1) }
    }
    # Sesión que quedó abierta (se han visto días de 49 h): no se descarta
    # el día, pero la conexión y el disponible se acotan al turno para que
    # no inflen las horas productivas ni abaraten el minuto del asesor.
    if ($min['Horas_conexion_agente'] -gt 720) {
      $fueraRango++
      $exc = $min['Horas_conexion_agente'] - $AUX_TURNO
      $min['Horas_conexion_agente'] = $AUX_TURNO
      $min['Disponible'] = [math]::Max(0, $min['Disponible'] - $exc)
    }
    $exBrk = [math]::Max(0, $min['Break'] - $AUX_BREAK)
    $exBan = [math]::Max(0, $min['Baño']  - $AUX_BANO)
    $perd  = $exBrk + $exBan + $min['Pausa'] + $min['Pausa Call Out'] + $min['Pausa Working']
    $prod  = [math]::Min($AUX_TURNO, $min['En Llamada'] + $min['Disponible'])

    if (-not $auxiliares.Contains($cc)) { $auxiliares[$cc] = [ordered]@{ dias = @(); meses = [ordered]@{} } }
    $auxiliares[$cc].dias += ,([pscustomobject][ordered]@{
      f=$fecha; con=$min['Horas_conexion_agente']; brk=$min['Break']; ban=$min['Baño']
      pau=$min['Pausa']; pco=$min['Pausa Call Out']; pw=$min['Pausa Working']
      coa=$min['Coaching']; acw=$min['ACW']; inc=$min['Incidente Técnico']
      lla=$min['En Llamada']; dis=$min['Disponible']
      ocu=$min['% Ocupación']; adh=$min['% Adherencia']; ini=$hIni; fin=$hFin
      exBrk=[math]::Round($exBrk,1); exBan=[math]::Round($exBan,1); perd=[math]::Round($perd,1); prod=[math]::Round($prod,1)
    })
    $diasLeidos++
  }

  # --- Por mes: ritmo propio del asesor y ventas que representa lo perdido
  foreach ($cc in @($auxiliares.Keys)) {
    $dias = @($auxiliares[$cc].dias | Sort-Object { $_.f })
    $auxiliares[$cc].dias = $dias
    foreach ($g in ($dias | Group-Object { $_.f.Substring(0,7) })) {
      $mk = $g.Name
      # En Hogar la venta que cuenta es la INSTALADA, medida por FECHA AGENDA.
      $exMes = @($ventas.Values | Where-Object { $_.cc -eq $cc -and $_.estado -eq 'INSTALADO' -and $_.agenda.ToString('yyyy-MM') -eq $mk })
      $cfmMes = [double](($exMes | Measure-Object -Property cfm -Sum).Sum)
      $hProd = (($g.Group | Measure-Object -Property prod -Sum).Sum) / 60
      $perd  = ($g.Group | Measure-Object -Property perd -Sum).Sum
      $ritmo = if ($hProd -gt 0) { $exMes.Count / $hProd } else { 0 }
      $arpu  = if ($exMes.Count) { $cfmMes / $exMes.Count } else { 0 }
      $vPerd = ($perd / 60) * $ritmo
      $auxiliares[$cc].meses[$mk] = [ordered]@{
        dias   = $g.Count
        perd   = [math]::Round($perd,0)
        perdDia= [math]::Round($perd / [math]::Max(1,$g.Count),1)
        exBrk  = [math]::Round((($g.Group | Measure-Object -Property exBrk -Sum).Sum),0)
        exBan  = [math]::Round((($g.Group | Measure-Object -Property exBan -Sum).Sum),0)
        pau    = [math]::Round((($g.Group | Measure-Object -Property pau -Sum).Sum),0)
        pco    = [math]::Round((($g.Group | Measure-Object -Property pco -Sum).Sum),0)
        pw     = [math]::Round((($g.Group | Measure-Object -Property pw  -Sum).Sum),0)
        hProd  = [math]::Round($hProd,1)
        ex     = $exMes.Count
        ritmo  = [math]::Round($ritmo,2)             # ventas por hora productiva
        vPerd  = [math]::Round($vPerd,1)             # ventas que representa lo perdido
        cfmPerd= [math]::Round($vPerd * $arpu)       # facturación que representa
        diasExc= @($g.Group | Where-Object { $_.perd -gt 0 }).Count
        # Promedio simple de los días del mes, tal como los calcula el Power BI cada día.
        ocu    = [math]::Round((($g.Group | Measure-Object -Property ocu -Average).Average),1)
        adh    = [math]::Round((($g.Group | Measure-Object -Property adh -Average).Average),1)
      }
    }
  }
  $auxMeta = [ordered]@{ turno=$AUX_TURNO; brk=$AUX_BREAK; ban=$AUX_BANO;
                         desde=(@($auxiliares.Values | ForEach-Object { $_.dias } | ForEach-Object { $_.f } | Sort-Object))[0]
                         hasta=(@($auxiliares.Values | ForEach-Object { $_.dias } | ForEach-Object { $_.f } | Sort-Object))[-1] }
  Ok ("Power BI de tiempos: {0} días-asesor de {1} asesores · {2} a {3}" -f $diasLeidos, $auxiliares.Count, $auxMeta.desde, $auxMeta.hasta)
  if ($fueraRango) { Avi "$fueraRango días con más de 12 h de conexión (sesión abierta): se acotaron al turno de 6 h" }
  $sinAux = @($auxActivos | Where-Object { -not $auxiliares.Contains($_.cedula.Trim()) } | ForEach-Object { $_.nombre })
  if ($sinAux.Count) { Avi "$($sinAux.Count) asesores sin tiempos en el Power BI: $($sinAux -join ', ')" }
} catch {
  Avi "no se pudo leer el Power BI de tiempos ($($_.Exception.Message)). El portal sale sin la pestaña de auxiliares."
  $auxiliares = [ordered]@{}; $auxMeta = $null
}

# ====================================================================== OJT
# Ventas OJT de la campaña (regla de Wilmer, 30/09/2026): cuentan
#   (a) TODAS las de la campaña HOGAR_OJT, de cualquier supervisor, y
#   (b) las del personal recién ingresado hasta ANTES de su fecha de ingreso
#       (que es la misma de su contratación).
# Se arma como un bloque aparte por mes; no toca las cifras personales.
$ojtItems = @{}
foreach ($k in $ojtAjenas.Keys) {
  $o = $ojtAjenas[$k]
  $ojtItems[$k] = [pscustomobject]@{ cc=$o.cc; nombre=$o.nombre; estado=$o.estado; agenda=$o.agenda; origen='Campaña OJT' }
}
foreach ($v in $todas) {
  $a = $porCC[$v.cc]
  $ing = if ($a.ingreso) { Get-Fecha $a.ingreso } else { $null }
  $esOjtCamp = ($v.campana -match 'OJT')
  $previa    = ($ing -and $v.agenda -lt $ing)
  if (-not ($esOjtCamp -or $previa)) { continue }
  $kk = if ($v.ot -and $v.ot -ne '0') { "OT$($v.ot)" } else { "X$($v.cc)|$($v.agenda.ToString('yyyyMMdd'))|$($v.cliCC)" }
  $ojtItems[$kk] = [pscustomobject]@{ cc=$v.cc; nombre=$a.nombre.Trim(); estado=$v.estado; agenda=$v.agenda
    origen = $(if ($previa) { 'Antes de su ingreso' } else { 'Campaña OJT' }) }
}
$ojtJson = [ordered]@{}
foreach ($mk in $clavesMes) {
  $del = @($ojtItems.Values | Where-Object {
    $m = $_.agenda.ToString('yyyy-MM'); if ($m -gt $mkCorte) { $m = $mkCorte }; $m -eq $mk })
  $pers = @($del | Group-Object cc | ForEach-Object {
    $g = @($_.Group)
    [ordered]@{ cc=$_.Name; nombre=$g[0].nombre
      origen = (@($g | ForEach-Object { $_.origen } | Sort-Object -Unique) -join ' + ')
      ventas = $g.Count; inst = @($g | Where-Object { $_.estado -eq 'INSTALADO' }).Count }
  } | Sort-Object { -$_.inst }, { -$_.ventas })
  $ojtJson[$mk] = [ordered]@{
    ventas = $del.Count
    inst   = @($del | Where-Object { $_.estado -eq 'INSTALADO' }).Count
    personas = $pers }
  Ok ("OJT {0}: {1} ventas, {2} instaladas, {3} personas" -f $mk, $ojtJson[$mk].ventas, $ojtJson[$mk].inst, $pers.Count)
}

# ==================================================================== SALIDA
# El esquema va indexado por mes: en agosto cambia para todos, y el portal
# tiene que poder mostrar julio con las reglas con las que julio se cerro.
$esqJson = [ordered]@{}
foreach ($mk in $clavesMes) {
  $esqJson[$mk] = [ordered]@{}
  if ($mk -eq '2026-09') {
    # Septiembre: tres skills distintos, cada uno con su esquema de bono plano.
    # Se emiten las tres claves (BLASTER/OUTBOUND/OMNICANAL); el portal elige la
    # del asesor via m[mes].skill.
    foreach ($t in $ESQ_SEP.Keys) { $esqJson[$mk][$t] = $ESQ_SEP[$t] }
    $esqJson[$mk]['unificado'] = $false
    Ok "$mk usa el modelo de bono mensual por piso: Blaster / Outbound / Omnicanal por separado"
  } elseif ($MESES_CON_ESQUEMA -notcontains $mk) {
    $esqJson[$mk]['unificado'] = $false
    Avi "$mk todavia no tiene metas de comision confirmadas: se muestran instaladas y proyeccion, sin piso ni comision"
  } else {
    foreach ($t in $ESQ_TIPO.Keys) { $esqJson[$mk][$t] = Esquema $mk $t }
    $uni = ((Esquema $mk 'OUTBOUND').nombre -eq (Esquema $mk 'BLASTER').nombre)
    $esqJson[$mk]['unificado'] = $uni
    if ($uni) { Ok "$mk usa un solo esquema para todo el equipo: $((Esquema $mk 'OUTBOUND').nombre)" }
  }
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
  ojt      = $ojtJson
  # Tiempos del día por asesor (Power BI de tiempos). Vacío si no respondió.
  aux      = $auxiliares
  auxMeta  = $auxMeta
}

$json = $doc | ConvertTo-Json -Depth 12 -Compress
[IO.File]::WriteAllText($Salida, $json, (New-Object Text.UTF8Encoding $false))

Write-Host "`n== resumen ==" -ForegroundColor Cyan
Write-Host ("  {0} agentes · {1} ventas · corte {2}" -f $agentesJson.Count, $ventas.Count, $doc.corte)
Write-Host ("  {0:N0} KB -> {1}" -f ((Get-Item $Salida).Length/1KB), $Salida)
if ($avisos.Count)  { Write-Host "  $($avisos.Count) avisos"  -ForegroundColor Yellow }
if ($errores.Count) { Write-Host "  $($errores.Count) ERRORES — revisar antes de publicar" -ForegroundColor Red; exit 1 }
Write-Host "  sin errores`n" -ForegroundColor Green
