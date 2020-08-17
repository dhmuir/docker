#
# PowerShell Script Module providing Docker Command wrappers.
#

<#
.Synopsis
Return the Windows Release Identifier (e.g. 1803, 1809, 1903, 2004) for the current host.
.Description
Function that returns the Windows Release Identifier (e.g. 1803, 1809, 1903, 2004) for the current host.
.Example
PS> Get-WindowsReleaseId
2004
#>
function Get-WindowsReleaseId() {
	[Alias()]
	[CmdletBinding()]
	param(
	)

	(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ReleaseId
}
