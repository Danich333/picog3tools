param(
    [string]$DeviceId = $null,
	[string]$OutputFile = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\device_status_output.txt"
)
$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
Set-Location -Path (Split-Path -Parent $MyInvocation.MyCommand.Definition)
$Command = ""
if ($DeviceId){
    $Command = "adb -s $DeviceId"
}

else {
    $Command = "adb"
}




# Check Wi-Fi Connection
$wifiStatus = Invoke-Expression "$Command shell dumpsys wifi | Select-String -Pattern 'state: CONNECTED'"
$wifiStatusText = if ($wifiStatus) { "Connected" } else { "Not Connected" }
$osversion = Invoke-Expression "$Command shell getprop ro.system.build.id"
$infoPath = Join-Path (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))) "info.txt"
$latestVersion = Select-String -Path $infoPath -Pattern "latest_version = (\d+\.\d+\.\d+)" | ForEach-Object { $_.Matches.Groups[1].Value }



if ($wifiStatus) {
    Write-Host "Wi-Fi: Connected"
} else {
    Write-Host "Wi-Fi: Not Connected"
	Start-Process powershell.exe -ArgumentList "-File", "play_sound.ps1", "-DeviceId", $DeviceId
    
}
Write-Host "OS Version:" $osversion
if ($osversion -eq $latestVersion) {
	Write-Host "System is on the latest OS version"}
else {
	Write-Host "System is not on the latest OS version. Playing a sound"
	Start-Process powershell.exe -ArgumentList "-File", "play_sound.ps1", "-DeviceId", $DeviceId}

$line = "$DeviceId		$osversion			   $wifiStatusText"
Add-Content -Path $OutputFile -Value $line

Invoke-Expression "$Command shell getprop ro.product.product.name"
