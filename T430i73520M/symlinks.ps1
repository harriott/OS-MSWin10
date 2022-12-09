# vim: set fdl=1:

# Joseph Harriott
# to be run in Administator Powershell

# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# depends on  $machine\PSProfile.ps1

#=> ~\_vimrc
new-item ~\_vimrc -itemtype symboliclink -value $machine\troin\_vimrc -force

#=> ~\.gitconfig
new-item ~\.gitconfig -itemtype symboliclink -value $machine\troin\gitconfig -force

#=> ~\.ssh\config
# new-item $HOME\.ssh\config -itemtype symboliclink -value $machine\jnbh\SSHconfig -force

