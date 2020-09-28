# vim: set et tw=0:
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed


# vim: ft=ps1.ps1region:
# Joseph Harriott
# to be run in Administator Powershell

#region --- MiKTeX

new-item C:\Users\troin\AppData\Roaming\MiKTeX\tex\latex\jo -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\core\IT_stack\CrossPlatform\forLaTeX -force

#endregion
#region --- ~\.bashrc

new-item C:\Users\troin\.bashrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\core\IT_stack\onGitHub\MSWin10\user\bashrc -force

#endregion
#region --- ~\.gitconfig

new-item C:\Users\troin\.gitconfig -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\core\IT_stack\onGitHub\MSWin10\LIP120s81A4\troin-gitconfig -force

#endregion
#region --- for PowerShell

new-item C:\Users\troin\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\core\IT_stack\onGitHub\MSWin10\LIP120s81A4\PSProfile.ps1 -force

#endregion
#region --- for vimfiles

new-item C:\Users\troin\_gvimrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\core\IT_stack\onGitHub\MSWin10\user\_gvimrc -force
new-item C:\Users\troin\_vimrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\core\IT_stack\onGitHub\MSWin10\user\_vimrc -force
new-item C:\Users\troin\vimfiles -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\core\IT_stack\vimfiles -force

#endregion

