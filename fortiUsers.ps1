#variables
$csv = import-csv -Path "C:\Users\shiranba\OneDrive - Essence Security\Fortigate Object Script - Users\users.csv"
$outfile = "C:\Users\shiranba\OneDrive - Essence Security\Fortigate Object Script - Users\users.txt"

#add intial line
Add-Content -Path $outfile "config user local"

#creating users in a loop
foreach ($line in $csv){
Add-Content -Path $outfile "edit ""$($line.name)"""
Add-Content -Path $outfile "set passwd $($line.password)"
Add-Content -Path $outfile "set two-factor email"
Add-Content -Path $outfile "set email-to $($line.email)"
Add-Content -Path $outfile "next"
}
Add-Content -Path $outfile "end"

#add intial line
Add-Content -Path $outfile "config user group"

foreach ($line in $csv){
Add-Content -Path $outfile "edit ""$($line.group)"""
Add-Content -Path $outfile "append member $($line.name)"
Add-Content -Path $outfile "next"
}
Add-Content -Path $outfile "end"

