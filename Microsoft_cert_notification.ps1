$result=@() 
 
$ErrorActionPreference="SilentlyContinue"
 
$a=Invoke-Command {Get-ChildItem Cert:\LocalMachine\ -Recurse |
Where-Object {$_ -is [System.Security.Cryptography.X509Certificates.X509Certificate2] -and $_.NotAfter -gt (Get-Date) -and $_.NotAfter -lt (Get-Date).AddDays(30)} }
 
foreach ($c in $a) {
$result+=New-Object -TypeName PSObject -Property ([ordered]@{
'Server'=$i;
'Certificate'=$c.Issuer;
'Expires'=$c.NotAfter 
})
 
} 
Write-Output $result
