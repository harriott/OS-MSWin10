# vim: set fdl=1:

# Joseph Harriott

# $machine\symlinks.ps1  to be run in Administator Powershell
#  depends on  $machine\PSProfile.ps1

#=> ~\.gitconfig
new-item ~\.gitconfig -itemtype symboliclink -value $machine\troin\gitconfig -force

#=> ~\.ssh\config
# new-item $HOME\.ssh\config -itemtype symboliclink -value $machine\jnbh\SSHconfig -force

