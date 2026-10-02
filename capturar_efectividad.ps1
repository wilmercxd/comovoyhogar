# ==========================================================================
#  ¿CÓMO VOY? HOGAR — captura diaria de llamadas y efectividad
#
#  La sección "Corte Agentes Hogar" del Power BI de operación solo muestra el
#  DÍA EN CURSO: no guarda histórico. Este script toma la foto del día por
#  asesor y la acumula en efectividad_historico.json (una entrada por cédula y
#  fecha; si se corre varias veces el mismo día, la última foto pisa a la
#  anterior). Se corre en la noche con la tarea programada y también dentro de
#  generar_datos.ps1.
#
#  Por día se guardan los conteos crudos, no los porcentajes, para que el mes
#  se pueda recalcular sumando:
#     m1    Marca1 (llamadas blaster)        omni  Llamadas OmniC (CallPreview)
#     motor Llamadas Motor (CallAuto)        man   Llamadas manuales
#     manU  Manuales únicos                  acc   Accesos (@) del día
#     accB  Accesos por blaster
#  Efect Blaster = accB / m1 · Efect General = acc / (m1 + omni + motor),
#  igual que las medidas Efect_Blaster_Hogar y Efect_General_Hogar.
#
#  Uso:  .\capturar_efectividad.ps1
# ==========================================================================
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

$EF_KEY  = 'f33167bd-2488-4725-86cf-07189241e0ce'
$EF_HOST = 'https://wabi-south-central-us-c-primary-api.analysis.windows.net'
$EF_HIST = Join-Path $PSScriptRoot 'efectividad_historico.json'
$EF_MED  = [ordered]@{
  m1='Marca1'; omni='CallPreview'; motor='CallAuto'; man='CallManual'; manU='CallManual_unicos'
  acc='Ventas_Accesos_Totales'; accB='Ventas_Accesos_Blaster'; act='Última actualización'
}

function Ef-Post([string]$ruta, $cuerpo, [switch]$crudo){
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  $req = [Net.HttpWebRequest]::Create($EF_HOST + $ruta)
  $req.AutomaticDecompression = [Net.DecompressionMethods]::GZip -bor [Net.DecompressionMethods]::Deflate
  $req.Headers.Add('X-PowerBI-ResourceKey', $EF_KEY)
  $req.Timeout = 120000
  if ($null -ne $cuerpo) {
    $req.Method = 'POST'; $req.ContentType = 'application/json'
    $b = [Text.Encoding]::UTF8.GetBytes(($cuerpo | ConvertTo-Json -Depth 40 -Compress))
    $st = $req.GetRequestStream(); $st.Write($b,0,$b.Length); $st.Close()
  }
  $resp = $req.GetResponse()
  $sr = [IO.StreamReader]::new($resp.GetResponseStream(), [Text.Encoding]::UTF8)
  $txt = $sr.ReadToEnd(); $sr.Close(); $resp.Close()
  if ($crudo) { return $txt }
  $txt = [regex]::Replace($txt, '"NextRefreshTime"\s*:\s*("[^"]*"|null|[\d.]+)\s*,?', '')
  return ($txt | ConvertFrom-Json)
}

# Cédulas a consultar: todo el roster (activos y retirados del mes, el filtro
# es barato y así no se pierde el último día de quien se retira).
$roster = Import-Csv (Join-Path $PSScriptRoot 'roster.csv') -Delimiter ';' -Encoding UTF8
$ccs = @($roster | Where-Object { $_.rol -eq 'ASESOR' } | ForEach-Object { $_.cedula.Trim() })

$crudoM = Ef-Post "/public/reports/$EF_KEY/modelsAndExploration?preferReadOnlySession=true" $null -crudo
if ($crudoM -notmatch '"models"\s*:\s*\[\s*\{[^{}]*?"id"\s*:\s*(\d+)') { throw 'no se encontró el id del modelo de efectividad' }
$efModel = [long]$Matches[1]

$sel = @([ordered]@{ Column = [ordered]@{ Expression=@{SourceRef=@{Source='p'}}; Property='documento' }; Name='cc' })
foreach ($k in $EF_MED.Keys) { $sel += [ordered]@{ Measure=[ordered]@{ Expression=@{SourceRef=@{Source='m'}}; Property=$EF_MED[$k] }; Name=$k } }
$consulta = [ordered]@{
  Version = 2
  From    = @(@{Name='p';Entity='Dim_PA';Type=0}, @{Name='m';Entity='Tabla_Medidas';Type=0})
  Select  = $sel
  Where   = @(@{ Condition = @{ In = @{
               Expressions = @(@{ Column = @{ Expression=@{SourceRef=@{Source='p'}}; Property='documento' } })
               Values = @($ccs | ForEach-Object { ,@(@{ Literal = @{ Value = "'$_'" } }) }) } } })
}
$cuerpo = [ordered]@{
  version = '1.0.0'; cancelQueries = @(); modelId = $efModel
  queries = @(@{ Query = @{ Commands = @(@{ SemanticQueryDataShapeCommand = [ordered]@{
    Query = $consulta
    Binding = [ordered]@{ Primary = @{ Groupings = @(@{ Projections = @(0..($sel.Count-1)) }) }
                          DataReduction = @{ DataVolume = 4; Primary = @{ Window = @{ Count = 5000 } } }; Version = 1 }
  } }) } })
}
$resp = Ef-Post '/public/reports/querydata?synchronous=true' $cuerpo

# Mismo formato comprimido del visor que en Auxiliares (R = repite, Ø = vacía).
$data  = $resp.results[0].result.data
$desc  = @{}; foreach ($x in $data.descriptor.Select) { $desc[$x.Value] = $x.Name }
$ds    = $data.dsr.DS[0]; $dicts = $ds.ValueDicts; $ph = $ds.PH[0]
$filasEf = $ph.($ph.PSObject.Properties.Name | Where-Object { $_ -like 'DM*' } | Select-Object -First 1)
$esq = $null; $cur = $null; $fotos = @()
foreach ($row in $filasEf) {
  if ($row.S) { $esq = @($row.S); $cur = New-Object object[] $esq.Count }
  $rep = if ($null -ne $row.R) { [int]$row.R } else { 0 }
  $vac = if ($null -ne $row.'Ø') { [int]$row.'Ø' } else { 0 }
  $C = @($row.C); $ci = 0
  for ($i=0; $i -lt $esq.Count; $i++) {
    if (($rep -shr $i) -band 1) { continue }
    if (($vac -shr $i) -band 1) { $cur[$i] = $null; continue }
    $cur[$i] = if ($ci -lt $C.Count) { $C[$ci] } else { $null }; $ci++
  }
  $o = @{}
  for ($i=0; $i -lt $esq.Count; $i++) {
    $nom = $desc[$esq[$i].N]; if (-not $nom) { continue }
    $v = $cur[$i]
    if ($esq[$i].DN -and ($v -is [int] -or $v -is [long])) { $v = $dicts.($esq[$i].DN)[[int]$v] }
    $o[$nom] = $v
  }
  $fotos += ,$o
}
if (-not $fotos.Count) { throw 'el Power BI de efectividad no devolvió filas' }

# La fecha del día sale de «Última actualización» (dd/MM/yyyy HH:mm) del propio
# Power BI, no del reloj del equipo: si la foto se toma pasada la medianoche,
# los datos siguen siendo del día que muestra el reporte.
$act = "$($fotos[0].act)"
if ($act -notmatch '^(\d{2})/(\d{2})/(\d{4})') { throw "fecha de actualización ilegible: '$act'" }
$fecha = "$($Matches[3])-$($Matches[2])-$($Matches[1])"

$hist = @{}
if (Test-Path $EF_HIST) {
  $hj = [IO.File]::ReadAllText($EF_HIST, [Text.UTF8Encoding]::new($false)) | ConvertFrom-Json
  foreach ($pc in $hj.PSObject.Properties) {
    $hist[$pc.Name] = [ordered]@{}
    foreach ($pd in ($pc.Value.PSObject.Properties | Sort-Object Name)) { $hist[$pc.Name][$pd.Name] = $pd.Value }
  }
}
$n = 0
foreach ($o in $fotos) {
  $cc = "$($o.cc)"; if (-not $cc) { continue }
  $d = [ordered]@{}
  foreach ($k in @('m1','omni','motor','man','manU','acc','accB')) {
    $x = 0.0; if ($null -ne $o[$k]) { [void][double]::TryParse("$($o[$k])", [Globalization.NumberStyles]::Float, [Globalization.CultureInfo]::InvariantCulture, [ref]$x) }
    $d[$k] = [int][math]::Round($x)
  }
  $d['act'] = $act
  if (-not $hist.ContainsKey($cc)) { $hist[$cc] = [ordered]@{} }
  $hist[$cc][$fecha] = [pscustomobject]$d
  $n++
}
[IO.File]::WriteAllText($EF_HIST, ($hist | ConvertTo-Json -Depth 5 -Compress), (New-Object Text.UTF8Encoding $false))
$dias = @($hist.Values | ForEach-Object { $_.Keys } | Sort-Object -Unique)
Write-Host ("  ok     efectividad: foto del {0} ({1}) · {2} asesores · histórico con {3} días" -f $fecha, $act, $n, $dias.Count) -ForegroundColor DarkGray
