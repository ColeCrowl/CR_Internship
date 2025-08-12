# Define the registry path for WDigest
$wDigestPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest"

# Create the parent key if it doesn't exist
New-Item -Path $wDigestPath -Force | Out-Null

# Set the UseLogonCredential DWORD value to 0 to disable WDigest
Set-ItemProperty -Path $wDigestPath -Name "UseLogonCredential" -Type DWord -Value 0

Write-Host "WDigest Authentication has been disabled." -ForegroundColor Green
