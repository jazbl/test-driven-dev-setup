# Create an integer $counter loop
$looper = $counter
$hostname = Get-Content -Path list.txt
$ping = ping $hostname[$looper] | Select-String "Packets"
Write-Host $hostname[$looper] $ping

# need to modify this to get the array loop working, and add the array index to both $hostname variables.
