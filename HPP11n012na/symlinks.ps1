# vim: set et tw=0:
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott
# to be run in Administator Powershell

#region --- ~\.bashrc

# new-item $HOME\.bashrc -itemtype symboliclink -value $MSWin\user\bashrc -force

#endregion
#region --- ~\.gitconfig

# new-item $HOME\.gitconfig -itemtype symboliclink -value $MSWin10\LIP120s81A4\jnbh-gitconfig -force

#endregion
#region --- Pandoc\defaults

$defaults = "$Env:AppData\Pandoc\defaults"
new-item "$defaults\md4pdfToC.yaml" -itemtype symboliclink -value $onGH\md4pdf\defaults-toc.yaml
new-item "$defaults\md4pdfMSWin.yaml" -itemtype symboliclink -value $onGH\md4pdf\MSWin\defaults.yaml
new-item "$defaults\md4pdf.yaml" -itemtype symboliclink -value $onGH\md4pdf\defaults.yaml

#endregion
#region --- Ctrl-CapsLock

# new-item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\Ctrl-CapsLock.ahk" -itemtype symboliclink -value $machine\Ctrl-CapsLock.ahk -force # not used
# new-item "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Ctrl-CapsLock.ahk" -itemtype symboliclink -value $machine\Ctrl-CapsLock.ahk -force

#endregion
#region --- PowerShell

# remove-item $HOME\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
# new-item $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -itemtype symboliclink -value $machine\PSProfile.ps1 -force

#endregion
#region - for vimfiles

# new-item $HOME\_gvimrc -itemtype symboliclink -value $MSWin\user\_gvimrc -force
# new-item $HOME\_vimrc -itemtype symboliclink -value $MSWin\user\_vimrc -force
# new-item $HOME\_vimrc -itemtype symboliclink -value $machine\jnbh\_vimrc -force
# remove-item $HOME\vimfiles -recurse -force
# new-item $HOME\vimfiles -itemtype symboliclink -value $ITstack\vimfiles -force

#endregion
