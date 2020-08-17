
Write-Host "Fetching Microsoft Build Tools distributions..."

$MsBuildToolsVersions = 
@{
	# VS 2017
	"15"     = "https://aka.ms/vs/15/release/vs_buildtools.exe"
	"15.8.9" = "https://aka.ms/AA363al"
	"15.7.6" = "https://aka.ms/AA20rf9"
	"15.6.7" = "https://aka.ms/n8k5v8"

	# VS 2019
	"16"     = "https://aka.ms/vs/16/release/vs_buildtools.exe"
}

foreach ($MsBuildToolsVersion in $MsBuildToolsVersions.GetEnumerator()) {

	Write-Host "MS Build Tools Version: $($MsBuildToolsVersion.Key)"
	
	Invoke-WebRequest -Uri $($MsBuildToolsVersion.Value) -UseBasicParsing  -OutFile ".\vs_buildtools_$($MsBuildToolsVersion.Key).exe"
}
