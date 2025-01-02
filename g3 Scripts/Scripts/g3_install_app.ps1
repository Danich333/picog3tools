$env:Path +=";C:\Android\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
adb install 3.4.2_nl.vrowl.vrcinema.pico.apk