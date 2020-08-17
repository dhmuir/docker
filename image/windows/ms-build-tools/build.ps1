
$OnlyId = $null
if ($null -ne $args[0]) {
	$OnlyId = $args[0]
}

if ($null -ne $OnlyId) {
	& .\build2017.ps1 $OnlyId
	& .\build2019.ps1 $OnlyId
}
else {
	& .\build2017.ps1
	& .\build2019.ps1
}
