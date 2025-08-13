<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-12
    Last Modified   : 2025-08-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-EP-000310

.TESTED ON
    Date(s) Tested  : 2025-08-03
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-EP-000310).ps1 
#>

# Define the registry path for DMA Protection
$dmaPath = "HKLM:\SYSTEM\CurrentControlSet\Control\DmaProtection"

# Create the parent key if it doesn't exist
New-Item -Path $dmaPath -Force | Out-Null

# Set the DmaProtectionEnabled DWORD value to 1 to enable
Set-ItemProperty -Path $dmaPath -Name "DmaProtectionEnabled" -Type DWord -Value 1

Write-Host "Kernel DMA Protection has been enabled. A system reboot is required for this setting to take effect." -ForegroundColor Green
