<#
.SYNOPSIS
    This PowerShell script enables a fix for logs, a transcript of all PowerShell commands and their output.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-11
    Last Modified   : 2025-08-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000327

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
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000327).ps1 
#>

# Define the registry path for PowerShell transcription
$psTranscriptPath = "HKLM:\Software\Policies\Microsoft\Windows\PowerShell\Transcription"

# Create the parent key if it doesn't exist
New-Item -Path $psTranscriptPath -Force | Out-Null

# Enable transcription by setting the 'EnableTranscripting' DWORD value to 1
Set-ItemProperty -Path $psTranscriptPath -Name "EnableTranscripting" -Type DWord -Value 1

# Optional: To specify a transcript output directory (recommended for centralized logging)
# Set-ItemProperty -Path $psTranscriptPath -Name "OutputDirectory" -Type String -Value "C:\PS_Transcripts"

# Note: The output directory path will need to exist on the system.
Write-Host "PowerShell transcription has been enabled." -ForegroundColor Green
