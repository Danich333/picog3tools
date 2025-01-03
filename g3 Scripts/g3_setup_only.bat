@echo off
cd /d "%~dp0"
powershell.exe -ExecutionPolicy Bypass -File "%~dp0.Backend_Files\Scripts\g3_setup.ps1"
pause