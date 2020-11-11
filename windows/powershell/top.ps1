
while (1) {
	Set-Variable -Name "pslist" -Value(ps | sort -desc cpu | select -first 30)
	sleep -seconds 2
	cls
	$pslist
}

