# vim: set fdl=1:

# Joseph Harriott

# $machBld\symlinks.ps1  to be run in  Administator Powershell
#  depends on  $machBld\PSProfile.ps1

#=> ~\.gitconfig
new-item ~\.gitconfig -itemtype symboliclink -value $machBld\user\jharr-gitconfig -force

