<#
.SYNOPSIS
    This PowerShell script ensures Windows Installer feature "Always install with elevated privileges" must be disabled..

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-04
    Last Modified   : 2025-08-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 2025-08-04
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000315).ps1 
#>

# Define the registry path where the Group Policy setting is stored
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"

# Define the name of the value to be configured
$valueName = "AlwaysInstallElevated"

# Define the required value (0 = Disabled)
$valueData = 0

# Set the registry key and value in a single command
# This creates the key if it doesn't exist and sets the value.
Set-ItemProperty -Path $regPath -Name $valueName -Value $valueData -Type DWORD -Force
