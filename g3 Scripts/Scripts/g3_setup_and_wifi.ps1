$env:Path +=";C:\Android\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
adb shell input keyevent 61 #first
adb shell input keyevent 66
adb shell sleep 3.5
adb shell input keyevent 61 #second
adb shell input keyevent 66
adb shell input keyevent 61 #language
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 66
adb shell sleep 1
adb shell input keyevent 61 #region
adb shell input keyevent 61
adb shell input keyevent 66
adb shell input keyevent 61 #wifi
adb shell input keyevent 61
adb shell input keyevent 66
adb shell input keyevent 61 #skip quick setup
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 66
#privacy policy
adb shell input keyevent 61
adb shell input keyevent 66 #enter second tab
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 66 #press check
adb shell input keyevent 61
adb shell input keyevent 66 #next page
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 66 #confirm
#dont share
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 66 #dont share
adb shell sleep 5 #wait
adb shell input keyevent 61
adb shell input keyevent 66 #next
adb shell sleep 6 #wait
adb shell input keyevent 61
adb shell input keyevent 66 #next
adb shell sleep 10
adb shell input keyevent 61
adb shell input keyevent 66 #check dont show
adb shell input keyevent 61
adb shell input keyevent 66 #confirm
#connect to wifi
adb shell sleep 5
adb shell am start -a android.settings.WIFI_SETTINGS
adb shell sleep 5
#adb shell input keyevent 61
#adb shell sleep 0.1
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
#finish putting in the password correctly
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