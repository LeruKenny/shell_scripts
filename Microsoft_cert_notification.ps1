$cert = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object {$_.Subject -like "*Microsoft*"}

foreach ($c in $cert) {
    $expirationDate = $c.NotAfter
    $timeLeft = New-TimeSpan -Start (Get-Date) -End $expirationDate
    if ($timeLeft.TotalDays -lt 30) {
        Send-MailMessage -From "example@email.com" -To "example@email.com" -Subject "Microsoft certificate expiration warning" -Body "The Microsoft certificate with subject $($c.Subject) is expiring on $expirationDate. Please renew it as soon as possible." -SmtpServer "smtp.example.com"
    }
}
