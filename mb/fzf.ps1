# vim: se fdl=2:

# & $MSwin10\mb\fzf.ps1

# Relaunch PowerShell after changing  fzf.exe !

#=> 0 downloaded  fzf.exe
& $ITscc\forMSWin\fzf.exe --version

#==> 0 into WindowsApps
cpi $ITscc\forMSWin\fzf.exe $HADL\Microsoft\WindowsApps

# #==> 1 out of WindowsApps
# ri $HADL\Microsoft\WindowsApps\fzf.exe

# #=> 0 winget 0 fzf add
# winget add fzf
# # then fix ; at end of path

#=> 0 winget 1 fzf remove
winget rm fzf

#=> 1 version
fzf --version

