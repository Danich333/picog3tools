$env:Path +=";C:\Android\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
adb shell am start -a android.settings.WIFI_SETTINGS
adb shell sleep 5
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