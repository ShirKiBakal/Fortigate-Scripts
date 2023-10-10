#variables
$groupname = "Example"
#csv name needs to be equal to groupname.
#path also must be change to fit your environment
$csv = import-csv -Path "C:\temp\$groupname.csv"
$outfile = "C:\temp\$groupname.txt"
$memeber=$null

#add intial line
Add-Content -Path $outfile "config firewall address"

#creating addresses in a loop
foreach ($line in $csv){
Add-Content -Path $outfile "edit ""$($line.name)"""
Add-Content -Path $outfile "set type $($line.type)"
Add-Content -Path $outfile "set $($line.set) $($line.value)"
Add-Content -Path $outfile "next"

#string builder for group
$memeber += "`"$($line.name)`" "
}
Add-Content -Path $outfile "end"


#creating group from "$member"
Add-Content -Path $outfile "config firewall addrgrp"
Add-Content -Path $outfile "edit $groupname"
Add-Content -Path $outfile "set member $memeber"
Add-Content -Path $outfile "end"

