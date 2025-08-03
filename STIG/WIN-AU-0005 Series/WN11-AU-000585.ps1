<#
.SYNOPSIS
    This PowerShell script ensures Windows 11 must have command line process auditing events enabled for failures. 

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-03
    Last Modified   : 2025-08-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000585

.TESTED ON
    Date(s) Tested  : 2025-08-03
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652

.USAGE
    .USAGE
    This script remediates the 'WN10-AU-000585' STIG by configuring the 
    specified settings. It should be run with administrative privileges.

    Example syntax:
    PS C:\> .\STIG-WN11-AU-000585_fix.ps1
#>

# Enable Audit Process Creation - Failure
auditpol /set /subcategory:"Process Creation" /failure:enable

# Enable command-line auditing via registry
$regPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
New-Item -Path $regPath -Force | Out-Null
Set-ItemProperty -Path $regPath -Name "ProcessCreationIncludeCmdLine_Enabled" -Type DWord -Value 1
