@echo off
cd /d "%~dp0"
powershell.exe -ExecutionPolicy Bypass -File "%~dp0Scripts\g3_setup_and_wifi.ps1"
pause