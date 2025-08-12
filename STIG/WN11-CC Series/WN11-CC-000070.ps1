
<#
.SYNOPSIS
    This PowerShell script ensures Virtualization-based Security is enabled.

.NOTES
    Author          : Cole Crowl
    LinkedIn        : https://www.linkedin.com/in/colecrowl/
    GitHub          : https://github.com/ColeCrowl/ColeCrowl
    Date Created    : 2025-08-11
    Last Modified   : 2025-08-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000070

.TESTED ON
    Date(s) Tested  : 2025-08-11
    Tested By       : Cole Crowl
    Systems Tested  : Windows 10 Pro 6.3
    PowerShell Ver. :  5.1.26100.4652 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000070).ps1 
#>

# Get the full path for the registry keys
$vbsRegPath = "HKLM:\System\CurrentControlSet\Control\DeviceGuard"
$vbsConfigPath = "HKLM:\System\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity"

# Ensure the parent keys exist
New-Item -Path $vbsRegPath -Force | Out-Null
New-Item -Path $vbsConfigPath -Force | Out-Null

# Enable Virtualization-Based Security
Set-ItemProperty -Path $vbsRegPath -Name "EnableVirtualizationBasedSecurity" -Type DWord -Value 1

# Configure Platform Security Level to Secure Boot
Set-ItemProperty -Path $vbsRegPath -Name "RequirePlatformSecurityFeatures" -Type DWord -Value 1

# Enable Hypervisor-Enforced Code Integrity (HVCI)
Set-ItemProperty -Path $vbsConfigPath -Name "Enabled" -Type DWord -Value 1

Write-Host "Virtualization-based Security settings applied. A reboot is required for changes to take full effect." -ForegroundColor Green
