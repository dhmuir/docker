
$OnlyId = $null
if ($null -ne $args[0]) {
	$OnlyId = $args[0]
}

if ($null -ne $OnlyId) {
	& .\push2017.ps1 $OnlyId
	& .\push2019.ps1 $OnlyId
}
else {
	& .\push2017.ps1
	& .\push2019.ps1
}
