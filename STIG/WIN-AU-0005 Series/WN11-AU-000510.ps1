<#
.SYNOPSIS
    This PowerShell script ensures The System Event Log size must be configured to 32768 KB (32 MB) or greater

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-03
    Last Modified   : 2025-08-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000510

.TESTED ON
    Date(s) Tested  : 2025-08-03
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652

.USAGE
    .USAGE
    This script remediates the 'WN11-AU-000585' STIG by configuring the 
    specified settings. It should be run with administrative privileges.

    Example syntax:
    PS C:\> .\STIG-WN11-AU-000510_fix.ps1
#>

# Define the registry path where the Group Policy setting is stored for the System log
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\System"

# Define the required log size in KB
$maxLogSizeKB = 32768

# Check if the registry key exists and create it if it doesn't
if (-not (Test-Path $regPath)) {
    Write-Host "Registry key not found. Creating $regPath..."
    New-Item -Path $regPath -Force | Out-Null
    Write-Host "Registry key created."
}

# Set the "MaxSize" value to configure the log size
Set-ItemProperty -Path $regPath -Name "MaxSize" -Value $maxLogSizeKB -Type DWORD -Force

