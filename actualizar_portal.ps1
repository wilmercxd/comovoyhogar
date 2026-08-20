# ==========================================================================
#  ¿CÓMO VOY? HOGAR — actualizar con un clic
#  Invocado por actualizar_portal.bat. Calcula el corte de "dia vencido"
#  (ayer, porque el dia de hoy siempre llega incompleto) y corre
#  generar_datos.ps1 + construir.ps1 en una sola pasada.
# ==========================================================================
[Console]::OutputEncoding = [Text.Encoding]::UTF8
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

Write-Host ""
Write-Host "============================================================"
Write-Host "  Como voy - Hogar : actualizando el portal"
Write-Host "============================================================"
Write-Host ""

$ayer = (Get-Date).AddDays(-1).ToString('yyyy-MM-dd')
Write-Host "  Corte: $ayer"
Write-Host ""

try {
  & "$PSScriptRoot\generar_datos.ps1" -Corte $ayer
  if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) {
    throw "generar_datos.ps1 termino con errores (ver el detalle arriba)"
  }

  Write-Host ""
  & "$PSScriptRoot\construir.ps1"
  if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) {
    throw "construir.ps1 termino con errores (ver el detalle arriba)"
  }

  Write-Host ""
  Write-Host "============================================================" -ForegroundColor Green
  Write-Host "  Listo. index.html quedo actualizado al corte de $ayer." -ForegroundColor Green
  Write-Host "  Falta subirlo a GitHub para que Vercel lo publique." -ForegroundColor Green
  Write-Host "============================================================" -ForegroundColor Green
}
catch {
  Write-Host ""
  Write-Host "  ERROR: $($_.Exception.Message)" -ForegroundColor Red
  Write-Host ""
}
finally {
  Write-Host ""
  Read-Host "Presiona Enter para cerrar"
}
