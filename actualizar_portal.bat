@echo off
rem Toda la logica (fecha de ayer, generar datos, construir, manejo de
rem errores) vive en actualizar_portal.ps1 -- se puede probar directo con
rem PowerShell sin pelear con el escapado de comillas de cmd.exe. Este
rem archivo solo existe porque un .ps1 no se ejecuta al hacer doble clic en
rem Windows (se abre en el editor); un .bat si.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0actualizar_portal.ps1"
