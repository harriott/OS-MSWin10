# vim: set fdl=1:

# Joseph Harriott - https://harriottgithubio/ - Sun 27 Oct 2024

# APS> $MSn\set > 2-PSProfile.ps1

#=> PSProfile.ps1
ni ~\PSEnv.ps1 -type symboliclink -value $MSn\PS\Env.ps1 -force
ni ~\PSProfile.ps1 -type symboliclink -value $MSn\PS\Profile.ps1 -force
#  b $HOME\PSProfile.ps1
#  csl ~\PSProfile.ps1

