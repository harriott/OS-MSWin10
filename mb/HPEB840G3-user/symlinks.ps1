# vim: set fdl=1:

# Joseph Harriott

# $MSWin10\mb\HPEB840G3-user\symlinks.ps1  to be run in  Administator Powershell
#  depends on  $MSWin10\PSProfile.ps1

#=> ~\.gitconfig
new-item ~\.gitconfig -itemtype symboliclink -value $MSWin10\mb\HPEB840G3-user\jharr-gitconfig -force
new-item ~\_gvimrc -itemtype symboliclink -value $MSWin10\mb\HPEB840G3-user\_gvimrc -force
new-item ~\_vimrc -itemtype symboliclink -value $MSWin10\mb\HPEB840G3-user\_vimrc -force

