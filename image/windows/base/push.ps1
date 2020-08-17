

Import-Module ..\script\DockerRegistry.psm1 -Force
Import-Module ..\script\MicrosoftWindows.psm1 -Force
$WindowsReleaseIds = Import-PowerShellDataFile ..\script\MicrosoftWindowsReleaseIds.psd1

if (-not (Get-IsDockerRegistryDefined)) {
	Write-Error "Docker Registry is not defined; specify this in ..\script\DockerRegistry.psd1"
	return $false
}

$CurrentWindowsReleaseId = Get-WindowsReleaseId
Write-Host "Current Windows Release Identifier is $CurrentWindowsReleaseId"

$tags2017 = @()
$tags2019 = @()
foreach ($WindowsReleaseId in $WindowsReleaseIds.Ids) {

	$tag = Get-DockerImageTag -UserId "dhmuir" -Tag "windows/ms-buildtools:2017-win-$WindowsReleaseId"
	$tags2017.Add($tag)

	Write-Host "Pushing Visual Studio Build Tools 2017 $WindowsReleaseId Docker Image"
	docker image push `
		--tag $tag

	Write-Host

	$tag = Get-DockerImageTag -UserId "dhmuir" -Tag "windows/ms-buildtools:2019-win-$WindowsReleaseId"
	$tags2019.Add($tag)
	
	Write-Host "Pushing Visual Studio Build Tools 2019 $WindowsReleaseId Docker Image"
	docker image build `
		--tag $tag

	Write-Host
}

$env:DOCKER_CLI_EXPERIMENTAL = 'enabled'
$tag2017_list = [System.String]::Join(' ', $tags2017)
$alias2017 = Get-DockerImageTag -UserId "dhmuir" -Tag "windows/ms-buildtools:2017"
docker manifest create $alias2017 $tag2017_list
docker manifest push $alias2017

$tag2019_list = [System.String]::Join(' ', $tags2019)
$alias2019 = Get-DockerImageTag -UserId "dhmuir" -Tag "windows/ms-buildtools:2019"
docker manifest create $alias2019 $tag2019_list
docker manifest push $alias2019