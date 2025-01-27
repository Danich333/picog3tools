param(
    [string]$DeviceId = $null
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
#$soundPath = Join-Path (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition)) "Sounds"
#$soundFile = Join-Path $soundPath "sound.mp4"
$Command = ""
if ($DeviceId){
    $Command = "adb -s $DeviceId"
    #adb -s $DeviceId shell mkdir /sdcard/sounds
    #adb -s $DeviceId push $soundFile /sdcard/sounds
}

else {
    $Command = "adb"
    #adb shell mkdir /sdcard/sounds
    #adb push $soundFile /sdcard/sounds
    
}

Invoke-Expression "$Command shell input keyevent 61" #first
Invoke-Expression "$Command shell input keyevent 61" #first
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.5"

Invoke-Expression "$Command shell input keyevent 61" #second
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.5"

Invoke-Expression "$Command shell input keyevent 61" #third
Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.5"

Invoke-Expression "$Command shell input keyevent 61" #fourth
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.5"

Invoke-Expression "$Command shell input keyevent 61" #fourth
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 5"

Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.5"

Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.5"

Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.5"

Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61" 
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 0.5"

Invoke-Expression "$Command shell input keyevent 61"
Invoke-Expression "$Command shell input keyevent 61"  
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 6"

Invoke-Expression "$Command shell input keyevent 61"
 
Invoke-Expression "$Command shell input keyevent 66"
Invoke-Expression "$Command shell sleep 5"


