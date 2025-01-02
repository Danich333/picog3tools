$env:Path +=";C:\Android\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
adb shell mkdir /sdcard/dload
adb shell mkdir /sdcard/dload
adb shell am start -a pvr.intent.action.SYSTEM_UPDATE #open system update
adb shell sleep 3
adb push "g3update.zip" /sdcard/dload/ #have to rename file to g3update.zip
adb shell sleep 3
#adb shell input keyevent 61
adb shell sleep 1
adb shell input keyevent 61
adb shell sleep 1
adb shell input keyevent 66
adb shell sleep 2
adb shell input keyevent 61
adb shell input keyevent 66