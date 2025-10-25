# vim: se fdl=2:

# & $MSWin10\build\fzf.ps1

# Relaunch PowerShell after changing  fzf.exe !

#=> fzf version
fzf --version

#=> fzf.exe check downloaded version
# from  https://github.com/junegunn/fzf/releases
& $ITscc\forMSWin\fzf.exe --version

#=> fzf.exe into WindowsApps
cpi $ITscc\forMSWin\fzf.exe $HADL\Microsoft\WindowsApps

# #=> fzf.exe out of WindowsApps
# ri $HADL\Microsoft\WindowsApps\fzf.exe

#=> winget fzf add
winget add fzf

#=> winget fzf remove
winget rm fzf

