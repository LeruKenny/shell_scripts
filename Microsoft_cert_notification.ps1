$caName = "fedramp-preprod-ca"


$certTemplates = Get-CATemplate -CertificationAuthority $caName
$result = @()

foreach ($certTemplate in $certTemplates) {

    # Get the certificates issued from the certificate template
    $certs = Get-ChildItem -Path cert:\LocalMachine -ExpiringInDays 30 | Where-Object { $_.Subject -match "$($certTemplate.Name)" }

    # Loop through each certificate
    foreach ($cert in $certs) {

        $result += New-Object -TypeName PSObject -Property ([ordered]@{
            'Certificate' = $cert.Name;
            'Expires'     = $cert.NotAfter
 
        })
    }
    
}
Write-Output $result 
$result | Export-Csv -Path "C:\Users\oajayi.tlx\Desktop\expired_certificate.csv" -Append -NoTypeInformation
