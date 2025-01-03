param(
    [string]$DeviceId = $null
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Join-Path (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))) "Content\Update File")
$soundPath = Join-Path (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition)) "Sounds"
$soundFile = Join-Path $soundPath "sound.mp4"
$Command = ""
if ($DeviceId){
    $Command = "adb -s $DeviceId"
    adb -s $DeviceId shell mkdir /sdcard/sounds
    adb -s $DeviceId push $soundFile /sdcard/sounds
}

else {
    $Command = "adb"
    adb shell mkdir /sdcard/sounds
    adb push $soundFile /sdcard/sounds
}
#Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
Invoke-Expression "$Command shell input keyevent KEYCODE_WAKEUP"
Invoke-Expression "$Command shell sleep 0.5"
Write-Host "First Page"
Invoke-Expression "$Command shell input keyevent 61" #first
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 3.5"
Write-Host "Second Page"
Invoke-Expression "$Command shell input keyevent 61" #second
Invoke-Expression "$Command shell input keyevent 66"
Write-Host "Language"
Invoke-Expression "$Command shell input keyevent 61" #language
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 1"
Write-Host "Region"
Invoke-Expression "$Command shell input keyevent 61" #region
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
Write-Host "WiFi"
Invoke-Expression "$Command shell input keyevent 61" #wifi
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
Write-Host "Quick Setup"
Invoke-Expression "$Command shell input keyevent 61" #skip quick setup
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
#privacy policy
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #enter second tab
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #press check
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #next page
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #confirm
#dont share
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #dont share
Invoke-Expression "$Command shell sleep 5" #wait
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #next
Invoke-Expression "$Command shell sleep 6" #wait
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #next
Invoke-Expression "$Command shell sleep 10"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #check dont show
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66" #confirm
#connect to wifi
Invoke-Expression "$Command shell sleep 5"
Invoke-Expression "$Command shell am start -a android.settings.WIFI_SETTINGS"
Invoke-Expression "$Command shell sleep 5"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell sleep 0.1"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.1"
Invoke-Expression "$Command shell input keyevent KEYCODE_CAPS_LOCK"
Invoke-Expression "$Command shell sleep 0.5"
Invoke-Expression "$Command shell input text 'v'"
Invoke-Expression "$Command shell sleep 0.5"
Invoke-Expression "$Command shell input keyevent KEYCODE_CAPS_LOCK"
Invoke-Expression "$Command shell input text 'r'"
Invoke-Expression "$Command shell sleep 0.5"
Invoke-Expression "$Command shell input keyevent KEYCODE_CAPS_LOCK"
Invoke-Expression "$Command shell input text 'e'"
Invoke-Expression "$Command shell sleep 0.5"
Invoke-Expression "$Command shell input text 'xpert'"
Invoke-Expression "$Command shell sleep 0.5"
#finish putting in the password correctly
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input text 'sdfghjkl'"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell am force-stop com.android.settings"
Invoke-Expression "$Command shell sleep 5"
#update from file
if ($DeviceId){
    adb -s $DeviceId shell mkdir /sdcard/dload
    adb -s $DeviceId shell am start -a pvr.intent.action.SYSTEM_UPDATE > $null #open system update
    adb -s $DeviceId shell sleep 3
    adb -s $DeviceId push "g3update.zip" /sdcard/dload/ #have to rename file to g3update.zip
    adb -s $DeviceId shell sleep 3
}
else {
    adb shell mkdir /sdcard/dload
    adb shell am start -a pvr.intent.action.SYSTEM_UPDATE > $null #open system update
    adb shell sleep 3
    adb push "g3update.zip" /sdcard/dload/ #have to rename file to g3update.zip
    adb shell sleep 3
}
Invoke-Expression "$Command shell input keyevent KEYCODE_WAKEUP"
Invoke-Expression "$Command shell sleep 0.5"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell sleep 1"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell sleep 1"
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 2"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 66"