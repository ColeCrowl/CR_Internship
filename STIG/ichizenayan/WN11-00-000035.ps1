<#
.SYNOPSIS
    This PowerShell script ensures the operating system must employ a deny-all, permit-by-exception policy.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-12
    Last Modified   : 2025-08-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000035 

.TESTED ON
    Date(s) Tested  : 2025-08-12
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-00-000035).ps1 
#>

# This is a sample to create a basic AppLocker policy.
# NOTE: This script does not fully meet the STIG. It is a starting point for building a policy.
# A full policy requires extensive planning and auditing.

# Define the output path for the AppLocker policy XML file
$policyFile = "C:\AppLocker_Policy.xml"

# Create a default AppLocker policy, which includes rules for all users
# to run programs from standard Windows and Program Files directories.
Get-AppLockerPolicy -Local | Set-AppLockerPolicy -XmlPath $policyFile

# To apply the policy, you would use the Set-AppLockerPolicy cmdlet.
# It is highly recommended to audit the policy first to find any exceptions.
# Set-AppLockerPolicy -XmlFilePath $policyFile -AuditOnly

Write-Host "A default AppLocker policy XML file has been created at $policyFile.
This is a complex control and should be carefully configured, audited, and tested before enforcing." -ForegroundColor Yellow
