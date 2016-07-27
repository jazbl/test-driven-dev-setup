$hostname = Get-Content -Path list.txt
$ping = ping $hostname | Select-String "Packets"
Write-Host $hostname[*] $ping

# need to modify this to get the array loop working, and add the array index to both $hostname variables.
