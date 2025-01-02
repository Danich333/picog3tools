@echo off
powershell.exe -ExecutionPolicy Bypass -NoExit -Command "$env:Path +=';C:\Android\platform-tools'; adb devices"
pause