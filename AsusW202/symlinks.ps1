
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott
# depends on  $machine\PSProfile.ps1
# run in Administator Powershell:  iex symlinks.ps1

.  $MSWin10\symlinks.ps1  # $MSWin10/symlinks.ps1

#region --- ~\.bashrc

# new-item ~/.bashrc -itemtype symboliclink -value $MSWin10/user/bashrc -force

#endregion
#region --- ~\.gitconfig

# new-item C:\Users\jharr\.gitconfig -itemtype symboliclink -value C:\Users\jharr\Dropbox\JH\core\IT_stack\onGitHub\MSWin10\LIP120s81A4\jharr\gitconfig -force
new-item ~\.gitconfig -itemtype symboliclink -value $machine\jharr\gitconfig -force

#endregion
#region --- vim

# new-item ~\_gvimrc -itemtype symboliclink -value $MSWin10\user\_gvimrc -force  # $MSWin10/user/_gvimrc
new-item ~\_vimrc -itemtype symboliclink -value $machine\jharr\_vimrc -force
# new-item ~\vimfiles -itemtype symboliclink -value $onGH\vimfiles -force

#endregion

