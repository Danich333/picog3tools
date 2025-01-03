@echo off
cd /d "%~dp0"
powershell.exe -ExecutionPolicy Bypass -NoExit -File "%~dp0.Backend_Files\Scripts\g3_check_status.ps1"
pause