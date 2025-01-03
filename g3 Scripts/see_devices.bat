@echo off
powershell.exe -ExecutionPolicy Bypass -Command "$env:Path +=';%~dp0.Backend_Files\platform-tools'; adb devices"
echo Press any key to exit...
pause >nul