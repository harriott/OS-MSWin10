
# Joseph Harriott
# to be run in Administator Powershell

# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# depends on  $machine\PSProfile.ps1

#region --- ~\.bashrc

# new-item ~/.bashrc -itemtype symboliclink -value $MSWin10/user/bashrc -force

#endregion
#region --- ~\.gitconfig

# new-item C:\Users\troin\.gitconfig -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\core\IT_stack\onGitHub\MSWin10\LIP120s81A4\troin\gitconfig -force
# new-item ~\.gitconfig -itemtype symboliclink -value $machine\troin\gitconfig -force

#endregion
#region --- for vimfiles

# new-item ~\_gvimrc -itemtype symboliclink -value $MSWin10\user\_gvimrc -force
new-item ~\_vimrc -itemtype symboliclink -value $machine\troin\_vimrc -force
# new-item ~\vimfiles -itemtype symboliclink -value $onGH\vimfiles -force

#endregion

