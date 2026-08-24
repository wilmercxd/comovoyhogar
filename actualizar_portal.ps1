# ==========================================================================
#  ¿CÓMO VOY? HOGAR — actualizar con un clic
#  Invocado por actualizar_portal.bat. Calcula el corte de "dia vencido"
#  (ayer, porque el dia de hoy siempre llega incompleto), corre
#  generar_datos.ps1 + construir.ps1, y publica en GitHub. Vercel despliega
#  solo en menos de un minuto.
#
#  IMPORTANTE: desde que esto publica solo, ya no se debe volver a subir el
#  portal a mano arrastrando archivos a la pagina de GitHub. Esa via y esta
#  no se pueden usar a la vez: si las dos tocan el mismo archivo, la
#  proxima vez que corra este script el push queda rechazado (rama
#  desactualizada) y hay que resolverlo a mano otra vez.
#
#  Ver que pasaria sin publicar nada:  .\actualizar_portal.ps1 -SoloProbar
# ==========================================================================
param([switch]$SoloProbar)

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
  Write-Host "  Revisando cambios..."
  $cambios = git status --porcelain
  $publicar = $true
  if (-not $cambios) {
    Write-Host ""
    Write-Host "  No hay nada nuevo que publicar: el portal ya esta al dia." -ForegroundColor Yellow
    $publicar = $false
  } else {
    $cambios | ForEach-Object { Write-Host "  $_" }
  }

  if ($publicar -and $SoloProbar) {
    Write-Host ""
    Write-Host "  Modo prueba: hasta aqui llega. No se publico nada." -ForegroundColor Yellow
    $publicar = $false
  }

  if ($publicar) {
    Write-Host ""
    Write-Host "  Publicando en GitHub..."
    git add -A
    git commit -m "Datos al corte $ayer" | ForEach-Object { Write-Host "  $_" }

    # git escribe su progreso normal por stderr aunque todo salga bien. Con
    # $ErrorActionPreference='Stop' eso se leeria como una falla y abortaria
    # el script aunque el push funcionara. Se juzga unicamente por el
    # codigo de salida, que es lo unico que de verdad dice si fallo.
    $ErrorActionPreference = 'Continue'
    git push 2>&1 | ForEach-Object { Write-Host "  $_" }
    $exitPush = $LASTEXITCODE
    $ErrorActionPreference = 'Stop'

    if ($exitPush -ne 0) {
      throw "No se pudo subir a GitHub. Si pidio usuario y clave, hay que reconectar la cuenta de GitHub una sola vez. Si dice que la rama esta desactualizada, alguien subio algo a mano a la pagina de GitHub -- avisale a Claude para reconciliarlo."
    }

    Write-Host ""
    Write-Host "============================================================" -ForegroundColor Green
    Write-Host "  Publicado. Vercel esta desplegando -- en menos de un minuto" -ForegroundColor Green
    Write-Host "  se ve el corte de $ayer en https://comovoyhogar.vercel.app" -ForegroundColor Green
    Write-Host "============================================================" -ForegroundColor Green
  }
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
