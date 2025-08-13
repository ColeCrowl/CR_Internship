<#
.SYNOPSIS
    This PowerShell script ensures the DoD Root CA certificates must be installed in the Trusted Root Store.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-12
    Last Modified   : 2025-08-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-PK-000005

.TESTED ON
    Date(s) Tested  : 2025-08-12
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-PK-000005).ps1 
#>

# This is an example script. You MUST replace 'C:\Path\To\YourCert.cer'
# with the actual path to your DoD Root CA certificate file.
$certFile = "C:\DoD_Root_CA_Certificate.cer"

# Check if the certificate file exists
if (Test-Path $certFile) {
    # Import the certificate into the Local Machine's Trusted Root Certification Authorities store
    Import-Certificate -FilePath $certFile -CertStoreLocation "Cert:\LocalMachine\Root"
    Write-Host "DoD Root CA certificate imported successfully." -ForegroundColor Green
} else {
    Write-Host "Error: Certificate file not found at '$certFile'. Please provide the correct path." -ForegroundColor Red
}
