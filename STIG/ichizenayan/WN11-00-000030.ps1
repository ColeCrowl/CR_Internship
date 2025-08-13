<#
.SYNOPSIS
    This PowerShell script ensures Windows 11 information systems must use BitLocker to encrypt all disks.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-12
    Last Modified   : 2025-08-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000030

.TESTED ON
    Date(s) Tested  : 2025-08-03
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-00-000030).ps1 
#>

# Define the registry paths for BitLocker configuration
$bitLockerPath = "HKLM:\SOFTWARE\Policies\Microsoft\FVE"

# Create the parent keys if they don't exist
New-Item -Path $bitLockerPath -Force | Out-Null

# Configure the minimum PIN length (as per related STIGs)
Set-ItemProperty -Path $bitLockerPath -Name "MinPin" -Type DWord -Value 6

# Configure the BitLocker encryption method for new drives (XTS-AES 256)
Set-ItemProperty -Path $bitLockerPath -Name "EncryptionMethod" -Type DWord -Value 7

Write-Host "BitLocker policy settings have been configured. The system is now ready for BitLocker encryption." -ForegroundColor Green
Write-Host "NOTE: To encrypt a drive, use the 'manage-bde' command or the BitLocker GUI. This script only sets the policy." -ForegroundColor Yellow
