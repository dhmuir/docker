

Import-Module ../script/MicrosoftWindows.psm1
$WindowsReleaseIds = Import-PowerShellDataFile ../script/MicrosoftWindowsReleaseIds.psd1

$CurrentWindowsReleaseId = Get-WindowsReleaseId
Write-Host "Current Windows Release Identifier is $CurrentWindowsReleaseId"

foreach ($WindowsReleaseId in $WindowsReleaseIds.Ids) {

	Write-Host "Pushing Visual Studio Build Tools 2019 $WindowsReleaseId Docker Image"
	docker image build `
		--tag ms-buildtools:2019-win-$WindowsReleaseId

	Write-Host
}
