@echo off
powershell.exe -ExecutionPolicy Bypass -Command "$env:Path +=';%~dp0platform-tools'; adb devices"
echo Press any key to exit...
pause