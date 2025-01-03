@echo off
cd /d "%~dp0"
powershell.exe -ExecutionPolicy Bypass -File "%~dp0.Backend_Files\Scripts\push_sound.ps1"
pause