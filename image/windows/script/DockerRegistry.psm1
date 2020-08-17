#
# PowerShell Script Module providing Docker Command wrappers.
#

$DockerImageSettings = Import-PowerShellDataFile $PSScriptRoot\DockerRegistry.psd1

<#
.Synopsis
Return whether a Docker Registry variable is defined.
.Description
Return whether a Docker Registry variable is defined.
.Example
PS> Get-IsDockerRegistryDefined
false
#>
function Get-IsDockerRegistryDefined {
	-not [System.String]::IsNullOrWhiteSpace($DockerImageSettings.DockerRegistry)
}

<#
.Synopsis
Return the Windows Release Identifier (e.g. 1803, 1809, 1903, 2004) for the current host.
.Description
Function that returns the Windows Release Identifier (e.g. 1803, 1809, 1903, 2004) for the current host.
.Parameter UserId
.Parameter Tag
.Example
PS> Get-DockerImageTag -UserId "dhm" -Tag "windows/servercore:1909"
2004
#>
function Get-DockerImageTag {
	[Alias()]
	[CmdletBinding()]
	param(
		[String] $UserId,
		[String] $Tag
	)

	if ([System.String]::IsNullOrWhiteSpace($DockerImageSettings.DockerRegistry)) {
		"$UserId/$Tag"
	}
	else {
		"$($DockerImageSettings.DockerRegistry)/$UserId/$Tag"
	}
}
