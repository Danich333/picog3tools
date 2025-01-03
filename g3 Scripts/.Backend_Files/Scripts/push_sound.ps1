$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Join-Path (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition)) "Sounds")
adb shell mkdir /sdcard/sounds
adb push "sound.mp4" /sdcard/sounds