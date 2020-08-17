

Import-Module ../script/MicrosoftWindows.psm1
$WindowsReleaseIds = Import-PowerShellDataFile ../script/MicrosoftWindowsReleaseIds.psd1

$CurrentWindowsReleaseId = Get-WindowsReleaseId
Write-Host "Current Windows Release Identifier is $CurrentWindowsReleaseId"

foreach ($WindowsReleaseId in $WindowsReleaseIds.Ids) {
	Write-Host "Pushing Visual Studio Build Tools 2017 $WindowsReleaseId Docker Image"
	docker image push `
		--tag ms-buildtools:2017-win-$WindowsReleaseId

	Write-Host
}
