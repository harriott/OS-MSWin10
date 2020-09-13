# vim: set et tw=0:
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott
# to be run in Administator Powershell

#region - ~\.bashrc

new-item C:\Users\troin\.bashrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\IT_stack\onGitHub\MSWin10\user\bashrc

#endregion
#region - ~\.gitconfig

new-item C:\Users\troin\.gitconfig -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\IT_stack\onGitHub\MSWin10\LIP120s81A4\troin-gitconfig
# Command Prompt run as administrator: mklink C:\Users\troin\.gitconfig C:\Users\troin\Dropbox\JH\IT_stack\onGitHub\MSWin10\LIP120s81A4\troin-gitconfig

#endregion
#region - for PowerShell

new-item C:\Users\troin\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\IT_stack\onGitHub\MSWin10\LIP120s81A4\PSProfile.ps1 -force

#endregion
#region - for vimfiles

new-item C:\Users\troin\_gvimrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\IT_stack\onGitHub\MSWin10\user\_gvimrc -force
new-item C:\Users\troin\_vimrc -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\IT_stack\onGitHub\MSWin10\user\_vimrc -force

#endregion

