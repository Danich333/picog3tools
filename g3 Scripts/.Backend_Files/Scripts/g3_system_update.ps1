param(
    [string]$DeviceId = $null
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
Set-Location -Path (Join-Path (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))) "Content\Update File")
Write-Host "The devices will update now. A white LED will flash while updating."
Write-Host "When finished, you will hear the sound from the initial setup screen."
Write-Host "Please make sure to turn on the controllers after the update is complete."
$Command = ""
if ($DeviceId){
    $Command = "adb -s $DeviceId"
    $osversion = Invoke-Expression "$Command shell getprop ro.system.build.id"
    $infoPath = Join-Path (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))) "info.txt"
    $latestVersion = Select-String -Path $infoPath -Pattern "latest_version = (\d+\.\d+\.\d+)" | ForEach-Object { $_.Matches.Groups[1].Value }
    if ($osversion -eq $latestVersion){
        exit
    }
    adb -s $DeviceId shell mkdir /sdcard/dload
    adb -s $DeviceId shell am start -a pvr.intent.action.SYSTEM_UPDATE > $null #open system update
    adb -s $DeviceId shell sleep 3
    adb -s $DeviceId push "g3update.zip" /sdcard/dload/ #have to rename file to g3update.zip
    adb -s $DeviceId shell sleep 3
}

else {
    $Command = "adb"
    $osversion = Invoke-Expression "$Command shell getprop ro.system.build.id"
    $infoPath = Join-Path (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))) "info.txt"
    $latestVersion = Select-String -Path $infoPath -Pattern "latest_version = (\d+\.\d+\.\d+)" | ForEach-Object { $_.Matches.Groups[1].Value }
    if ($osversion -eq $latestVersion){
        exit
    }
    adb shell mkdir /sdcard/dload
    adb shell am start -a pvr.intent.action.SYSTEM_UPDATE > $null #open system update
    adb shell sleep 3
    adb push "g3update.zip" /sdcard/dload/ #have to rename file to g3update.zip
    adb shell sleep 3
}

if ($osversion -eq $latestVersion){
    Write-Host "System already up to date"
    Start-Sleep -Seconds 3
    exit
}

Invoke-Expression "$Command shell input keyevent KEYCODE_WAKEUP"
Invoke-Expression "$Command shell sleep 0.5"
if ($osversion -ne $latestVersion){
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell sleep 1"}

Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell sleep 1"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 2"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"

