# Gets the contents of the certificates on the machine based on the file path
$cert = Get-ChildItem -Path Cert:\LocalMachine -Recurse | Where-Object {$_.Subject -like "*Fedramp"}
$result = @()

# Loops through the certificates to check for Certificate less than 30 days to expiration
foreach ($c in $cert) {
    $timeLeft = ($c.NotAfter - (Get-Date).Date).Days
    if ($timeLeft -ge 0 -and $timeLeft -lt 2000 ){
        # Collects all the certificate name and expiration date into result 
        $result+=New-Object -TypeName PSObject -Property ([ordered]@{
                     'Certificate'=$c.Issuer;
                     'Expiry Date'=$c.NotAfter
        }) 
    }
}    

Write-Output $result
$File_name = Get-Date -Format "yyyy-MM-dd"
# Exports the content of the result into a Csv file
$result | Export-Csv -Path "C:\Users\Leru Kenny\Desktop\Expired_cert_$($File_name).csv" -Append -NoTypeInformation
