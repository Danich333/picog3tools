param(
    [string]$DeviceId = $null
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
$Command = ""
if ($DeviceId){
    $Command = "adb -s $DeviceId"
}

else {
    $Command = "adb"
}
Invoke-Expression "$Command shell input keyevent KEYCODE_WAKEUP"
Invoke-Expression "$Command shell sleep 0.5"
Invoke-Expression "$Command shell am force-stop com.picovr.settings"
Invoke-Expression "$Command shell am start -n com.picovr.settings/com.picovr.vrsettingslib.UnityActivity -a pui.settings.action.GENERAL_SETTINGS"
Invoke-Expression "$Command shell sleep 0.5"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
exit
