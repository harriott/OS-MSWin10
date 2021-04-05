
# Joseph Harriott
# to be run in Administator Powershell

# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

#region --- Ctrl-CapsLock

# new-item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\Ctrl-CapsLock.ahk" -itemtype symboliclink -value $machine\Ctrl-CapsLock.ahk -force # not used
# new-item "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Ctrl-CapsLock.ahk" -itemtype symboliclink -value $machine\Ctrl-CapsLock.ahk -force

#endregion
#region --- PowerShell

# remove-item $HOME\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# new-item $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -itemtype symboliclink -value $machine\PSProfile.ps1 -force

#endregion
#region --- ~\_vimrc

# new-item $HOME\_vimrc -itemtype symboliclink -value $machine\jnbh\_vimrc -force

#endregion
#region --- ~\.gitconfig

new-item C:\Users\jnbh\_gvimrc -itemtype symboliclink -value $onGH\MSWin10\user\_gvimrc -force
new-item C:\Users\jnbh\_vimrc -itemtype symboliclink -value $onGH\MSWin10\LIP120s81A4\troin\_vimrc -force
new-item C:\Users\jnbh\vimfiles -itemtype symboliclink -value $onGH\vimfiles -force

#endregion
