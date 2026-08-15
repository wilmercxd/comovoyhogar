# ==========================================================================
#  ¿CÓMO VOY? HOGAR — construir index.html
#  Inyecta ventas.json dentro de portal_src.html
#  Uso:  .\construir.ps1
# ==========================================================================
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [Text.Encoding]::UTF8

$src    = Join-Path $PSScriptRoot 'portal_src.html'
$datos  = Join-Path $PSScriptRoot 'ventas.json'
$logo   = Join-Path $PSScriptRoot 'logo.png'
$salida = Join-Path $PSScriptRoot 'index.html'

foreach ($f in @($src,$datos)) { if (-not (Test-Path $f)) { throw "Falta $f. Corre primero generar_datos.ps1" } }

$html = [IO.File]::ReadAllText($src,  [Text.UTF8Encoding]::new($false))
$json = [IO.File]::ReadAllText($datos,[Text.UTF8Encoding]::new($false))

# Un '</script>' dentro de los datos cerraria la etiqueta antes de tiempo.
$json = $json.Replace('</','<\/')

$marca = '/*__VENTAS__*/null/*__FIN__*/'
if ($html.IndexOf($marca) -lt 0) { throw "No se encontro el marcador $marca en portal_src.html" }
$html = $html.Replace($marca, $json)

# --- logo de Conexiones Digitales, incrustado como data URI
if (Test-Path $logo) {
  $b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($logo))
  $html = $html.Replace('__LOGO__', "data:image/png;base64,$b64")
  Write-Host ("  logo incrustado ({0:N0} KB)" -f ((Get-Item $logo).Length/1KB)) -ForegroundColor DarkGray
} else {
  Write-Host "  AVISO: falta logo.png, el portal sale sin logo" -ForegroundColor Yellow
  $html = $html.Replace('__LOGO__','')
}

[IO.File]::WriteAllText($salida, $html, [Text.UTF8Encoding]::new($false))

$doc = $json.Replace('<\/','</') | ConvertFrom-Json
Write-Host ""
Write-Host "  index.html generado" -ForegroundColor Green
Write-Host ("  corte {0} · {1} agentes · {2:N0} KB" -f $doc.corte, $doc.agentes.Count, ((Get-Item $salida).Length/1KB))
Write-Host "  El archivo lleva dentro los datos de todo el equipo y cedulas de clientes:" -ForegroundColor Yellow
Write-Host "  publicalo solo con Deployment Protection activa en Vercel." -ForegroundColor Yellow
Write-Host ""
