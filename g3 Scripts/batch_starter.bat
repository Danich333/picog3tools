@echo off
setlocal

set EXIT_FLAG=0
set FIRST_START=1

:start_batch

set UPD="n"
set CHOICE=

:: Add platform-tools to PATH
set PATH=%PATH%;%~dp0.Backend_Files\platform-tools

::delete files if they exist
if exist "%~dp0CHECK_FILE.txt" del /f /q "%~dp0CHECK_FILE.txt"
if exist "%~dp0device_status_output.txt" del /f /q "%~dp0device_status_output.txt"

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
echo Device ID                       OS Version                 Wi-Fi Status                        Pass/Fail > "%OUTPUT_FILE%"

:: Create a check file
set CHECK_FILE=%~dp0CHECK_FILE.txt
echo 0 > "%CHECK_FILE%"

:: Get the list of connected devices
echo Detecting connected devices...
set DEVICE_LIST=
:: Initialize device counter
set DEVICE_COUNT=0
set CHECK_INT=

:: Ensure delayed expansion is enabled
setlocal enabledelayedexpansion

for /f "skip=1 tokens=1" %%d in ('adb devices') do (
    if not "%%d"=="offline" if not "%%d"=="unauthorized" if not "%%d"=="" (
        set DEVICE_LIST=!DEVICE_LIST! %%d
    )
)

:: Check if any devices were found
if not defined DEVICE_LIST (
    echo No devices connected. Try again.
    pause
    goto :start_batch
)

:: Confirm device list
for %%i in (!DEVICE_LIST!) do (
    adb -s %%i shell svc wifi enable
    set /a DEVICE_COUNT+=1
)

if %FIRST_START% == 1 (
    echo Would you like to run system update?
    set /p UPD= (y for yes, n for no^))
    if /i "%UPD%"=="y" (
        echo updating
        set CHOICE=0
        goto :skip
    )
)
set FIRST_START=0
echo WARNING! PLEASE MAKE SURE THE CONTROLLERS ARE ON BEFORE PROCEEDING
:: List available scripts
echo Select a task:
echo 0 - System update
echo 1 - Check device status
echo 2 - Perform the initial setup and WiFi
echo 3 - Connect to VRExpert WiFi
echo 4 - Install app
echo 5 - Restart all devices
echo 6 - Initial Setup Only
echo 7 - Factory Reset
echo 8 - Play Sound
echo 9 - Stop sound
echo L - List connected devices
echo a - Shut all devices down
echo e - Exit

:: Prompt user for choice
set /p CHOICE=Enter the script number to run:

:skip

set FIRST_START=0

:: Determine the script to run
if "%CHOICE%"=="e" (
    set EXIT_FLAG=1
    goto :exit_func
)
if "%CHOICE%"=="0" set SCRIPT=g3_system_update.ps1
if "%CHOICE%"=="1" set SCRIPT=check_status_all.ps1
if "%CHOICE%"=="2" set SCRIPT=g3_setup_and_wifi.ps1
if "%CHOICE%"=="3" set SCRIPT=g3_wifi_VRExpert.ps1
if "%CHOICE%"=="4" set SCRIPT=g3_install_app.ps1
if "%CHOICE%"=="5" set SCRIPT=restart_all.ps1
if "%CHOICE%"=="6" set SCRIPT=g3_setup.ps1
if "%CHOICE%"=="7" set SCRIPT=g3_factory_reset.ps1
if "%CHOICE%"=="8" set SCRIPT=play_sound.ps1
if "%CHOICE%"=="9" set SCRIPT=stop_sound.ps1
if /i "%CHOICE%"=="a" set SCRIPT=shut_down_all.ps1
if /i "%CHOICE%"=="u" set SCRIPT=ultra4_setup.ps1
if /i "%CHOICE%"=="l" goto :show_all

if not defined SCRIPT (
    echo Invalid choice. Try again.
    goto :start_batch
)

:: Get the full path to the selected script
set SCRIPT_PATH=%~dp0.Backend_Files\Scripts\%SCRIPT%

if not exist "%SCRIPT_PATH%" (
    echo Script "%SCRIPT%" not found in .Backend_Files\Scripts. Exiting.
    pause
    exit /b
)

echo Connected devices:
for %%i in (!DEVICE_LIST!) do echo %%i
echo Running "%SCRIPT%" on all connected devices...

:: Run the script on each device
for %%i in (!DEVICE_LIST!) do (
    ::set /a DEVICE_COUNT+=1
    start powershell.exe -ExecutionPolicy Bypass -NoProfile -File "%SCRIPT_PATH%" -DeviceId %%i -OutputFile "%OUTPUT_FILE%"
    
)

if "%SCRIPT%" == "check_status_all.ps1" (
    echo Waiting...
    :retry
    call :run_check
    echo call run check
)

goto :start_batch

:run_check
setlocal enabledelayedexpansion
set CHECK_INT=0  
for /l %%j in (1,1,20) do ( 
    ping 192.0.2.1 -n 1 -w 500 >nul
    set /p CHECK_INT=<"%CHECK_FILE%"
    if !CHECK_INT! == !DEVICE_COUNT! (
        echo All devices checked in.
        ping 192.0.2.1 -n 1 -w 200 >nul
        type "%OUTPUT_FILE%"
        goto :end_run_check
    )
)
echo Timed out waiting for devices.
:end_run_check
endlocal
goto :start_batch

:show_all
setlocal enabledelayedexpansion
set DEVICE_COUNT=0
set DEVICE_LIST=
for /f "skip=1 tokens=1" %%d in ('adb devices') do (
    if not "%%d"=="offline" if not "%%d"=="unauthorized" if not "%%d"=="" (
        set DEVICE_LIST=!DEVICE_LIST! %%d
    )
)
if not defined DEVICE_LIST (
    echo No devices connected. Try again.
    pause
    goto :start_batch
)
for %%i in (!DEVICE_LIST!) do (
    set /a DEVICE_COUNT+=1
)
echo Connected devices:
for %%i in (!DEVICE_LIST!) do echo %%i
echo Number of connected devices: %DEVICE_COUNT%
goto :start_batch


:exit_func
del /f /q "%OUTPUT_FILE%"
del /f /q "%CHECK_FILE%"
if "%EXIT_FLAG%"=="1"(
    goto :eof
)
endlocal

