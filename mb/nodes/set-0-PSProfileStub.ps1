# vim: fdl=1:

# Joseph Harriott - https://harriottgithubio/ - ven 05 juil 2024

# PS> . $MSWin10\mb\neededNodes-0-PSProfileStub.ps1

function endi { if ( ! ( test-path $args[0] ) ) { md $args[0] } } # ensure directory

#=> 0 $MSWin10
$MSWin10 = 'D:\Dropbox\JH\core\IT_stack\onGitHub\OS-MSWin10'
if ( test-path "~\_noDropbox.ps1" ) { $MSWin10 = 'D:\IT_stack\onGitHub\OS-MSWin10' }
# $MSWin10\mb\_noDropbox.ps1

#=> 1 PSProfileStub - PS
$DWP = "~\Documents\PowerShell"; endi $DWP
cpi $MSWin10\PSProfileStub.ps1 ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

#=> 1 PSProfileStub - WPS
$DWP = "~\Documents\WindowsPowerShell"; endi $DWP
cpi $MSWin10\PSProfileStub.ps1 ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

