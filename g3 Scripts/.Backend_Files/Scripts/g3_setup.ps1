param(
    [string]$DeviceId = $null
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
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
exit