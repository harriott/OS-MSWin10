
# vim: set fdl=3:

# Joseph Harriott - Tue 25 Jul 2023
# $machine\updateModules.ps1
# some commands here are defined in my  $MSWin10\PSProfile.ps1
# update my modules

# obviated by  compare-module - see  $MSWin10\QR.md

# Get-InstalledModule | Format-Table -Property Name; Get-Module

cmu  # = Check-ModuleUpdates
# - doesn't find all (ignore InvalidOperations...) ends with highlighted updates

$IMs = 'BurntToast', 'posh-git', 'PackageManagement', 'PowerColorLS', 'PSFzf', 'PSReadLine', 'Terminal-Icons', 'ZLocation'
Function vc {
  $fvcc = "(Get-"+$args[1]+"Module -Name "+$args[0]+" | select version | Format-Table -HideTableHeaders | Out-String).trim()"
  iex $fvcc
}

SCFCW; "Update-Modules:"; SCRC
foreach ($IM in $IMs) { $vc = vc $IM 'Installed'; "$IM $vc" } # before
# SCFCW; "Update-Module"; SCRC; Update-Module
foreach ($IM in $IMs) { $vc = vc $IM 'Installed'; "$IM $vc" } # after

SCFCW; "Modules that need manual attention:"; SCRC
Check-ModuleUpdate BurntToast  # not caught by  cmu
Check-ModuleUpdate PowerShellGet

