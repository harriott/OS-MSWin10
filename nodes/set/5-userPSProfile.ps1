# vim: set fdl=1:

# Joseph Harriott - https://harriottgithubio/ - lun 28 oct 2024
# $HDH  defined in  $MSn\PS\Env.ps1

# APS> . $MSn\set\1-PSProfile.ps1

#=> PSProfile.ps1 - deaur
ni $HDH\Env.ps1 -type symboliclink -value $MSn\PS\Env.ps1 -force
ni $HDH\PSProfile.ps1 -type symboliclink -value $MSn\PS\Profile.ps1 -force
#  PS> b $HOME\PSProfile.ps1
#  PS> csl ~\*.ps1

