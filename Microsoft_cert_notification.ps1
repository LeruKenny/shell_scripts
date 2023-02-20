$result=@()  
# $ErrorActionPreference="SilentlyContinue"
 
$a = Get-ChildItem Cert:\LocalMachine -Recurse -ExpiringInDays 2000 
 
foreach ($c in $a) {
$result+=New-Object -TypeName PSObject -Property ([ordered]@{
'Certificate'=$c.Issuer;
'Expires'=$c.NotAfter 
})
 
} 
Write-Output $result
$result | Export-Csv -Path "C:\Users\\Desktop\certs_to_expire.csv" -Append -NoTypeInformation
