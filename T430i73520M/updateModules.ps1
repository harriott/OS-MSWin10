# vim: set fdl=3:

# Joseph Harriott
# update my modules

# Get-InstalledModule | Format-Table -Property Name; Get-Module

$IMs = 'posh-git', 'PowerColorLS', 'PSFzf', 'Terminal-Icons', 'ZLocation'
$Ms = 'PowerShellGet', 'PSReadLine'
Function vc {
  $fvcc = "(Get-"+$args[1]+"Module -Name "+$args[0]+" | select version | Format-Table -HideTableHeaders | Out-String).trim()"
  iex $fvcc
}

SCFCW; "Installed Modules"; SCRC
foreach ($IM in $IMs) { $vc = vc $IM 'Installed'; "$IM $vc" }
SCFCW; "Update-Module"; SCRC; Update-Module
foreach ($IM in $IMs) { $vc = vc $IM 'Installed'; "$IM $vc" }

SCFCW; "Modules"; SCRC
foreach ($M in $Ms) { $vc = vc $M; "$M $vc" }
SCFCW; $reply = Read-Host 'o to see versions online'; SCRC
if ($reply -eq 'o') {
  start microsoft-edge:https://www.powershellgallery.com/packages/PSReadLine/
  start microsoft-edge:https://www.powershellgallery.com/packages/PowerShellGet/
  }

