@echo off
powershell.exe -ExecutionPolicy Bypass -NoExit -Command "$env:Path +=';C:\Android\platform-tools'; adb shell reboot -p"
echo Press any key to exit...
pause >nul