$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Join-Path (Split-Path -Parent(Split-Path -Parent $MyInvocation.MyCommand.Definition)) "Apks")
adb install 3.4.2_nl.vrowl.vrcinema.pico.apk