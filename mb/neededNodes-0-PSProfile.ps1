# vim: set fdl=1:

# Joseph Harriott - https://harriottgithubio/ - lun 24 juin 2024

# APS> . $MSWin10\mb\neededNodes-0.ps1

#=> PSProfile.ps1
$MSWin10 = 'D:\Dropbox\JH\core\IT_stack\onGitHub\OS-MSWin10'
ni ~\Env.ps1 -type symboliclink -value $MSWin10\Env.ps1 -force
ni ~\PSProfile.ps1 -type symboliclink -value $MSWin10\PSProfile.ps1 -force
# b $HOME\PSProfile.ps1
# csl ~\PSProfile.ps1

