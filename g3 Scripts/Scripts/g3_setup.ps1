$env:Path +=";C:\Android\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
Write-Host "First Page"
adb shell input keyevent 61 #first
adb shell input keyevent 66
adb shell sleep 3.5
Write-Host "Second Page"
adb shell input keyevent 61 #second
adb shell input keyevent 66
Write-Host "Language"
adb shell input keyevent 61 #language
adb shell input keyevent 61
adb shell input keyevent 61
adb shell input keyevent 66
adb shell sleep 1
Write-Host "Region"
adb shell input keyevent 61 #region
adb shell input keyevent 61
adb shell input keyevent 66
Write-Host "WiFi"
adb shell input keyevent 61 #wifi
adb shell input keyevent 61
adb shell input keyevent 66
Write-Host "Quick Setup"
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
