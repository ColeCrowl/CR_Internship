<#
.SYNOPSIS
    This PowerShell script disables a legacy authentication method that can store credentials in an insecure manner.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-11
    Last Modified   : 2025-08-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000038

.TESTED ON
    Date(s) Tested  : 2025-08-11
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Open powershell ise and create new file,
    copy paste into powershell. 
    
    For additional information or if error review information at:
    https://stigaview.com/products/win11/v1r5/
    
    syntax can be found here.
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000038).ps1 
#>

# Define the registry path for WDigest
$wDigestPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest"

# Create the parent key if it doesn't exist
New-Item -Path $wDigestPath -Force | Out-Null

# Set the UseLogonCredential DWORD value to 0 to disable WDigest
Set-ItemProperty -Path $wDigestPath -Name "UseLogonCredential" -Type DWord -Value 0

Write-Host "WDigest Authentication has been disabled." -ForegroundColor Green
