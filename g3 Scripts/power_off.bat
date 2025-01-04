@echo off
powershell.exe -ExecutionPolicy Bypass -NoExit -Command "$env:Path +=';%~dp0.Backend_Files\platform-tools'; adb shell reboot -p"
echo Press any key to exit...
pause