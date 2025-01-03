param(
    [string]$DeviceId = $null
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Join-Path (Split-Path -Parent(Split-Path -Parent(Split-Path -Parent $MyInvocation.MyCommand.Definition)))".\Content\Apks")
$Command = ""
if ($DeviceId){
    $Command = "adb -s $DeviceId"
}

else {
    $Command = "adb"
}

Invoke-Expression "$Command install 3.4.2_nl.vrowl.vrcinema.pico.apk"

exit