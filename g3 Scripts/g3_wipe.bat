@echo off
cd /d "%~dp0"
powershell.exe -ExecutionPolicy Bypass -File "%~dp0Scripts\g3_factory_reset.ps1"
pause