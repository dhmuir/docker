

Import-Module ..\script\DockerRegistry.psm1 -Force
Import-Module ..\script\MicrosoftWindows.psm1 -Force
$WindowsReleaseIds = Import-PowerShellDataFile ..\script\MicrosoftWindowsReleaseIds.psd1

$CurrentWindowsReleaseId = Get-WindowsReleaseId
Write-Host "Current Windows Release Identifier is $CurrentWindowsReleaseId"

$OnlyId = $null
if ($null -ne $args[0]) {
	$OnlyId = $args[0]
	Write-Host "Passed '$OnlyId' so will only build that Windows release (if found)."
}

foreach ($WindowsReleaseId in $WindowsReleaseIds.Ids) {	

	if ($null -ne $OnlyId -and $OnlyId -ne $WindowsReleaseId) {
		Write-Host "Skipping $WindowsReleaseId as its not configured to build."
		continue
	}
	
	$tag = Get-DockerImageTag -UserId "dhmuir" -Tag "windows/ms-buildtools:2019-win-$WindowsReleaseId"
	
	Write-Host "Building Visual Studio Build Tools 2019 $WindowsReleaseId Docker Image"
	docker image build `
		--isolation hyperv `
		--file Dockerfile.2019 `
		--memory 8GB `
		--build-arg FROM_IMAGE=mcr.microsoft.com/windows/servercore:$WindowsReleaseId `
		--tag $tag `
		.

	Write-Host
}
