@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

echo ============================================================
echo   Como voy - Hogar : actualizando el portal
echo ============================================================
echo.

rem "dia vencido": la fecha de ayer, porque el propio dia de hoy siempre
rem llega incompleto (la instalacion se reporta con un dia de rezago).
for /f "delims=" %%i in ('powershell -NoProfile -Command "(Get-Date).AddDays(-1).ToString(''yyyy-MM-dd'')"') do set AYER=%%i

echo   Corte: %AYER%
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "generar_datos.ps1" -Corte %AYER%
if errorlevel 1 (
  echo.
  echo   ERROR generando los datos. Revisa el mensaje de arriba antes de continuar.
  echo.
  pause
  exit /b 1
)

echo.
powershell -NoProfile -ExecutionPolicy Bypass -File "construir.ps1"
if errorlevel 1 (
  echo.
  echo   ERROR construyendo el portal. Revisa el mensaje de arriba.
  echo.
  pause
  exit /b 1
)

echo.
echo ============================================================
echo   Listo. index.html quedo actualizado al corte de %AYER%.
echo   Falta subirlo a GitHub para que Vercel lo publique.
echo ============================================================
echo.
pause
