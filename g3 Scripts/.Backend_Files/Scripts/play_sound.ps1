param(
    [string]$DeviceId = $null
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
if ($DeviceId){
    $Command = "adb -s $DeviceId"
}

else {
    $Command = "adb"
}
    Invoke-Expression "$Command shell am force-stop com.picovr.wing.videoplayer"
    Write-Host  "Playing the sound..."
    Invoke-Expression "$Command shell input keyevent KEYCODE_WAKEUP"
    Invoke-Expression "$Command shell sleep 0.3"
    #opens the video player app and plays the specified file
    Invoke-Expression "$Command shell am start -n com.picovr.wing.videoplayer/.UnityActivity -d file:///sdcard/sounds/sound.mp4"

#Pause