# vim: set et tw=0:
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed


# vim: ft=ps1.ps1region:
# Joseph Harriott
# to be run in Administator Powershell

#region --- MiKTeX
# --- MiKTeX

new-item C:\Users\troin\AppData\Roaming\MiKTeX\tex\latex\jo -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\Sh-81A4\ITS-CrossPlatform\forLaTeX

#endregion
#region - ~\.bashrc

new-item C:\Users\troin\.bashrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\Sh-81A4\ITS-onGitHub\MSWin10\user\bashrc

#endregion
#region - ~\.gitconfig

new-item C:\Users\troin\.gitconfig -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\Sh-81A4\ITS-onGitHub\MSWin10\LIP120s81A4\troin-gitconfig
# Command Prompt run as administrator: mklink C:\Users\troin\.gitconfig C:\Users\troin\Dropbox\JH\Sh-81A4\ITS-onGitHub\MSWin10\LIP120s81A4\troin-gitconfig

#endregion
#region - for PowerShell

new-item C:\Users\troin\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\Sh-81A4\ITS-onGitHub\MSWin10\LIP120s81A4\PSProfile.ps1 -force

#endregion
#region - for vimfiles

new-item C:\Users\troin\_gvimrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\Sh-81A4\ITS-onGitHub\MSWin10\user\_gvimrc -force
new-item C:\Users\troin\_vimrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\Sh-81A4\ITS-onGitHub\MSWin10\user\_vimrc -force
new-item C:\Users\troin\vimfiles -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\Sh-81A4\ITS-vimfiles -force

#endregion

