<#
.SYNOPSIS
    This PowerShell script ensures the system must be configured to use FIPS-compliant algorithms.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-12
    Last Modified   : 2025-08-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000230

.TESTED ON
    Date(s) Tested  : 2025-08-12
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000230).ps1 
#>

# Define the registry path for FIPS mode
$fipsPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\FipsAlgorithmPolicy"

# Create the parent key if it doesn't exist
New-Item -Path $fipsPath -Force | Out-Null

# Set the Enabled DWORD value to 1 to enable FIPS-compliant algorithms
Set-ItemProperty -Path $fipsPath -Name "Enabled" -Type DWord -Value 1

Write-Host "FIPS-compliant algorithms have been enabled system-wide." -ForegroundColor Green
Write-Host "NOTE: This may cause compatibility issues with older applications. Extensive testing is recommended." -ForegroundColor Yellow
