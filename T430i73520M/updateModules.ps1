
# vim: set fdl=3:

# Joseph Harriott
# update my modules

# Get-InstalledModule | Format-Table -Property Name; Get-Module

Check-ModuleUpdates

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
Check-ModuleUpdate BurntToast  # not caught by  Check-ModuleUpdates
Check-ModuleUpdate PowerShellGet

