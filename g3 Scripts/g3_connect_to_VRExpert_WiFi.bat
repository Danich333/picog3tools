@echo off
cd /d "%~dp0"
powershell.exe -ExecutionPolicy Bypass -File "%~dp0Scripts\g3_wifi_VRExpert.ps1"
pause