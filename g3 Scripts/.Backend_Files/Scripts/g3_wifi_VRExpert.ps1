param(
    [string]$DeviceId = $null
)

$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)


if ($DeviceId) {
    $wifiStatus = adb -s $DeviceId shell dumpsys wifi | Select-String -Pattern "state: CONNECTED"
    if($wifiStatus) {
    exit
    }
    adb -s $DeviceId shell input keyevent KEYCODE_WAKEUP
    adb -s $DeviceId shell sleep 0.5
    adb -s $DeviceId shell am start -a android.settings.WIFI_SETTINGS
    adb -s $DeviceId shell sleep 1
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell sleep 0.1
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell sleep 0.1
    adb -s $DeviceId shell input keyevent 66
    adb -s $DeviceId shell sleep 0.1
    adb -s $DeviceId shell input keyevent KEYCODE_CAPS_LOCK
    adb -s $DeviceId shell sleep 0.5
    adb -s $DeviceId shell input text "v"
    adb -s $DeviceId shell sleep 0.5
    adb -s $DeviceId shell input keyevent KEYCODE_CAPS_LOCK
    adb -s $DeviceId shell input text "r"
    adb -s $DeviceId shell sleep 0.5
    adb -s $DeviceId shell input keyevent KEYCODE_CAPS_LOCK
    adb -s $DeviceId shell input text "e"
    adb -s $DeviceId shell sleep 0.5
    adb -s $DeviceId shell input text "xpert"
    adb -s $DeviceId shell sleep 0.5
    #change this and add to init setup script
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input keyevent 66
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input keyevent 66
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input text "sdfghjkl"
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input keyevent 61
    adb -s $DeviceId shell input keyevent 66
    adb -s $DeviceId shell sleep 5
    adb -s $DeviceId shell am force-stop com.android.settings
}
else{
    $wifiStatus = adb shell dumpsys wifi | Select-String -Pattern "state: CONNECTED"
    if($wifiStatus) {
    exit
    }
    adb shell input keyevent KEYCODE_WAKEUP
    adb shell sleep 0.5
    adb shell am start -a android.settings.WIFI_SETTINGS
    adb shell sleep 1
    adb shell input keyevent 61
    adb shell sleep 0.1
    adb shell input keyevent 61
    adb shell sleep 0.1
    adb shell input keyevent 66
    adb shell sleep 0.1
    adb shell input keyevent KEYCODE_CAPS_LOCK
    adb shell sleep 0.5
    adb shell input text "v"
    adb shell sleep 0.5
    adb shell input keyevent KEYCODE_CAPS_LOCK
    adb shell input text "r"
    adb shell sleep 0.5
    adb shell input keyevent KEYCODE_CAPS_LOCK
    adb shell input text "e"
    adb shell sleep 0.5
    adb shell input text "xpert"
    adb shell sleep 0.5
    #change this and add to init setup script
    adb shell input keyevent 61
    adb shell input keyevent 66
    adb shell input keyevent 61
    adb shell input keyevent 61
    adb shell input keyevent 61
    adb shell input keyevent 66
    adb shell input keyevent 61
    adb shell input text "sdfghjkl"
    adb shell input keyevent 61
    adb shell input keyevent 61
    adb shell input keyevent 61
    adb shell input keyevent 61
    adb shell input keyevent 66
    adb shell sleep 5
    adb shell am force-stop com.android.settings
}
