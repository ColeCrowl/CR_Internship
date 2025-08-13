<#
.SYNOPSIS
    This PowerShell script ensures Windows 11 must be configured to audit Detailed File Share Failures.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-03
    Last Modified   : 2025-08-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000570

.TESTED ON
    Date(s) Tested  : 2025-08-03
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Open powershell ise and create new file,
    copy paste into powershell. 
    
    For additional information or if error review information at:
    https://stigaview.com/products/win11/v1r5/
    
    syntax can be found here.
    PS C:\> .\__remediation_template(STIG-ID-WN11-AU-000570).ps1 
#>

# Define the audit policy subcategory
$subcategory = "Detailed File Share"

# Define the audit flag for failures
$failureFlag = "/failure:enable"

# Use auditpol.exe to set the policy
auditpol /set /subcategory:"$subcategory" $failureFlag
