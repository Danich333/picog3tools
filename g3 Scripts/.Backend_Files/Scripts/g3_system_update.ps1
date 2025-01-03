param(
    [string]$DeviceId = $null
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
Set-Location -Path (Join-Path (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))) "Content\Update File")
$Command = ""
if ($DeviceId){
    $Command = "adb -s $DeviceId"
    adb -s $DeviceId shell mkdir /sdcard/dload
    adb -s $DeviceId shell am start -a pvr.intent.action.SYSTEM_UPDATE > $null #open system update
    adb -s $DeviceId shell sleep 3
    adb -s $DeviceId push "g3update.zip" /sdcard/dload/ #have to rename file to g3update.zip
    adb -s $DeviceId shell sleep 3
}

else {
    $Command = "adb"
    adb shell mkdir /sdcard/dload
    adb shell am start -a pvr.intent.action.SYSTEM_UPDATE > $null #open system update
    adb shell sleep 3
    adb push "g3update.zip" /sdcard/dload/ #have to rename file to g3update.zip
    adb shell sleep 3
}
Invoke-Expression "$Command shell input keyevent KEYCODE_WAKEUP"
Invoke-Expression "$Command shell sleep 0.5"
#Invoke-Expression "$Command shell input keyevent 61
Invoke-Expression "$Command shell sleep 1"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell sleep 1"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 2"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"