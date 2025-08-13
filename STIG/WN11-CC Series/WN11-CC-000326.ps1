<#
.SYNOPSIS
    This PowerShell script ensures enables logging of script blocks in PowerShell.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-11
    Last Modified   : 2025-08-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326

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
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000326).ps1 
#>

# Define the registry path for PowerShell logging
$psLoggingPath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"

# Create the parent key if it doesn't exist
New-Item -Path $psLoggingPath -Force | Out-Null

# Create/set the EnableScriptBlockLogging DWORD value to 1
Set-ItemProperty -Path $psLoggingPath -Name "EnableScriptBlockLogging" -Type DWord -Value 1

Write-Host "PowerShell script block logging has been enabled." -ForegroundColor Green
