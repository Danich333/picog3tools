$env:Path += ";$(Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))\platform-tools"
# Check Wi-Fi Connection
$wifiStatus = adb shell dumpsys wifi | Select-String -Pattern "state: CONNECTED"
$osversion = adb shell getprop ro.system.build.id
$infoPath = Join-Path (Split-Path -Parent (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Definition))) "info.txt"
$latestVersion = Select-String -Path $infoPath -Pattern "latest_version = (\d+\.\d+\.\d+)" | ForEach-Object { $_.Matches.Groups[1].Value }

function Play-Sound {
	do {
		Write-Host  "Playing the sound..."
		adb shell input keyevent KEYCODE_WAKEUP
    	adb shell sleep 0.3
		#opens the video player app and plays the specified file
    	adb shell am start -n com.picovr.wing.videoplayer/.UnityActivity -d file:///sdcard/sounds/sound.mp4 > $null 
	

		$choice = Read-Host "Press 'P' to play the sound again, or 'S' to stop the sound"
	
		if ($choice -eq 'S') {
			Write-Host "Stopping the sound..."
			adb shell am force-stop com.picovr.wing.videoplayer > $null
			break } #breaks the loop 
		elseif ($choice -ne 'P'){
			Write-Host "Invalid input. Press 'P' to play sound again or 'S' to stop."}
	
	}while ($choice -ne 'S')
	
}

if ($wifiStatus) {
    Write-Host "Wi-Fi: Connected"
} else {
    Write-Host "Wi-Fi: Not Connected"
	Play-Sound
    
}
Write-Host "OS Version:" $osversion
if ($osversion -eq $latestVersion) {
	Write-Host "System is on the latest OS version"}
else {
	Write-Host "System is not on the latest OS version. Playing a sound"
	Play-Sound}

adb shell getprop ro.product.product.name