<#
.SYNOPSIS
    This PowerShell script configures secure paths for the critical SYSVOL and NETLOGON shares.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-11
    Last Modified   : 2025-08-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000050

.TESTED ON
    Date(s) Tested  : 2025-08-11
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000050).ps1 
#>

# Define the registry path for Hardened UNC Paths
$uncPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths"

# Create the parent key if it doesn't exist
New-Item -Path $uncPath -Force | Out-Null

# Create/set a value for the SYSVOL share to require integrity and mutual authentication
Set-ItemProperty -Path $uncPath -Name "\\*\SYSVOL" -Type String -Value "RequireMutualAuthentication=1,RequireIntegrity=1"

# Create/set a value for the NETLOGON share
Set-ItemProperty -Path $uncPath -Name "\\*\NETLOGON" -Type String -Value "RequireMutualAuthentication=1,RequireIntegrity=1"

Write-Host "Hardened UNC Paths for SYSVOL and NETLOGON have been configured." -ForegroundColor Green
