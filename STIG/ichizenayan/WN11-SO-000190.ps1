<#
.SYNOPSIS
    This PowerShell script ensures  Kerberos encryption types must be configured to prevent the use of DES and RC4.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-12
    Last Modified   : 2025-08-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000190

.TESTED ON
    Date(s) Tested  : 2025-08-12
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Open powershell ise and create new file,
    copy paste into powershell. 
    
    For additional information or if error review information at:
    https://stigaview.com/products/win11/v1r5/
    
    syntax can be found here.
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000190).ps1 
#>

# Define the registry path for Kerberos policy
$kerberosPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"

# Create the parent keys if they don't exist
New-Item -Path $kerberosPath -Force | Out-Null

# Set the SupportedEncryptionTypes DWORD to 24 to enable AES only (DES/RC4 are disabled)
Set-ItemProperty -Path $kerberosPath -Name "SupportedEncryptionTypes" -Type DWord -Value 24

Write-Host "Kerberos encryption types have been configured to AES only." -ForegroundColor Green
Write-Host "NOTE: This is a local setting. The domain-wide Group Policy should be configured for full compliance." -ForegroundColor Yellow
