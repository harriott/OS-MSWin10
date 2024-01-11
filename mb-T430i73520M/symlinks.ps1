# vim: set fdl=1:

# Joseph Harriott

# $machBld\symlinks.ps1  to be run in  Administator Powershell
#  depends on  $machBld\PSProfile.ps1

#=> ~\.gitconfig
new-item ~\.gitconfig -itemtype symboliclink -value $machBld\user\troin-gitconfig -force

# #=> ~\.ssh\config
# new-item $HOME\.ssh\config -itemtype symboliclink -value $machBld\jnbh\SSHconfig -force

