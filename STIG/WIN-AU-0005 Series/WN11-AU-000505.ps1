<#
.SYNOPSIS
    This PowerShell script ensures The Security Event Log size must be configured to 1024000 KB (1 GB) or greater

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-03
    Last Modified   : 2025-08-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000505

.TESTED ON
    Date(s) Tested  : 2025-08-03
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652

.USAGE
    .USAGE
    This script remediates the 'WN11-AU-000505' STIG by configuring the 
    specified settings. It should be run with administrative privileges.

    Example syntax:
    PS C:\> .\STIG-WN11-AU-000505_fix.ps1
#>

# Define the registry path where the Group Policy setting is stored
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Security"

# Define the required log size in KB
$maxLogSizeKB = 1024000

# Set the registry key and value in a single command
# This creates the key if it doesn't exist and sets the "MaxSize" value.
Set-ItemProperty -Path $regPath -Name "MaxSize" -Value $maxLogSizeKB -Type DWORD -Force
