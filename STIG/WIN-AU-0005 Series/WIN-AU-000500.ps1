<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-03
    Last Modified   : 2025-08-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-08-03
    Tested By       : Cole Crowl
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>


$logName = "Application"
$minSizeKB = 32768

# Get current log settings
$logSettings = Get-EventLog -LogName $logName -List

# Check current size and update if needed
if ($logSettings.MaximumKilobytes -lt $minSizeKB) {
    Write-Host "Current size ($($logSettings.MaximumKilobytes) KB) is less than required. Updating..."
    wevtutil sl $logName /ms:$($minSizeKB * 1024)
    Write-Host "Log size updated to $minSizeKB KB."
} else {
    Write-Host "Current size ($($logSettings.MaximumKilobytes) KB) meets or exceeds requirement. No action needed."
}
