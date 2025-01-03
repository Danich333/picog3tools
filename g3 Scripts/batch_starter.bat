@echo off
:: Add platform-tools to PATH
set PATH=%PATH%;%~dp0.Backend_Files\platform-tools

:: Verify adb is available
adb version >nul 2>&1
if errorlevel 1 (
    echo "adb is not available in the specified platform-tools directory. Exiting."
    pause
    exit /b
)

:: Change directory to the location of the batch file
cd /d "%~dp0"

:: Initialize the output file
set OUTPUT_FILE=%~dp0device_status_output.txt
echo Device ID                       OS Version                 Wi-Fi Status > "%OUTPUT_FILE%"

:: List available scripts
echo Select a task:
echo 0 - Perform full setup with WiFi and System Update (g3_full_setup.ps1)
echo 1 - Check device status (g3_check_status.ps1)
echo 2 - Connect to VRExpert WiFi (g3_wifi_VRExpert.ps1)
echo 3 - Setup and Wifi (g3_setup_and_wifi.ps1)
echo 4 - Install app (g3_install_app.ps1)
echo 5 - System update (g3_system_update.ps1)
echo 6 - Initial Setup Only (g3_setup.ps1)
echo 7 - Factory Reset (g3_factory_reset.ps1)
echo 8 - Play Sound

:: Prompt user for choice
set /p CHOICE=Enter the script number to run (0/1/2/3/4/5/6/7):

:: Determine the script to run
if "%CHOICE%"=="0" set SCRIPT=g3_full_setup.ps1
if "%CHOICE%"=="1" set SCRIPT=check_status_all.ps1
if "%CHOICE%"=="2" set SCRIPT=g3_wifi_VRExpert.ps1
if "%CHOICE%"=="3" set SCRIPT=g3_setup_and_wifi.ps1
if "%CHOICE%"=="4" set SCRIPT=g3_install_app.ps1
if "%CHOICE%"=="5" set SCRIPT=g3_system_update.ps1
if "%CHOICE%"=="6" set SCRIPT=g3_setup.ps1
if "%CHOICE%"=="7" set SCRIPT=g3_factory_reset.ps1
if "%CHOICE%"=="8" set SCRIPT=play_sound.ps1



if not defined SCRIPT (
    echo Invalid choice. Exiting.
    pause
    exit /b
)

:: Get the full path to the selected script
set SCRIPT_PATH=%~dp0.Backend_Files\Scripts\%SCRIPT%

if not exist "%SCRIPT_PATH%" (
    echo Script "%SCRIPT%" not found in .Backend_Files\Scripts. Exiting.
    pause
    exit /b
)

:: Get the list of connected devices
echo Detecting connected devices...
set DEVICE_LIST=

:: Ensure delayed expansion is enabled
setlocal enabledelayedexpansion

for /f "skip=1 tokens=1" %%d in ('adb devices') do (
    if not "%%d"=="offline" if not "%%d"=="unauthorized" if not "%%d"=="" (
        set DEVICE_LIST=!DEVICE_LIST! %%d
    )
)

:: Check if any devices were found
if not defined DEVICE_LIST (
    echo No devices connected. Exiting.
    pause
    exit /b
)

:: Confirm device list
echo Connected devices:
for %%i in (!DEVICE_LIST!) do echo %%i
echo Running "%SCRIPT%" on all connected devices...

:: Run the script on each device
for %%i in (!DEVICE_LIST!) do (
    start powershell.exe -ExecutionPolicy Bypass -NoProfile -File "%SCRIPT_PATH%" -DeviceId %%i -OutputFile "%OUTPUT_FILE%"
)

pause
endlocal
