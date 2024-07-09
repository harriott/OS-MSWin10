# vim: se fdl=1:

# & $MSwin10\mb\fzf.ps1

# Relaunch PowerShell after changing  fzf.exe !

#=> 0 fzf.exe into WindowsApps
cpi $ITscc\forMSWin\fzf.exe $HADL\Microsoft\WindowsApps
fzf --version

#=> 0 install with winget
winget add fzf
# then fix ; at end of path

#=> 1 fzf.exe out of WindowsApps
ri $HADL\Microsoft\WindowsApps\fzf.exe

#=> 0 remove with winget
winget rm fzf

