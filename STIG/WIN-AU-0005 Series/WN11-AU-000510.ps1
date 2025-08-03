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

$sizeBytes = 32768 * 1024
wevtutil sl System /ms:$sizeBytes
