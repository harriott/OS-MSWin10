# vim: fdl=1:

# Joseph Harriott - https://harriottgithubio/ - Sun 27 Oct 2024

# PS> . $MSn\set\1-PSProfileStub.ps1

function endi { if ( ! ( test-path $args[0] ) ) { md $args[0] } } # ensure directory

#=> 1 PSProfileStub - PS
$DWP = "~\Documents\PowerShell"; endi $DWP
cpi $MSn/PS/ProfileStub.ps1 ~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1

#=> 1 PSProfileStub - WPS
$DWP = "~\Documents\WindowsPowerShell"; endi $DWP
cpi $MSn\PS\ProfileStub.ps1 ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

