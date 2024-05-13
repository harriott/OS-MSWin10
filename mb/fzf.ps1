# vim: se fdl=1:

# iex $MSwin10\mb\fzf.ps1

#=> 0 fzf.exe into WindowsApps
cpi $ITscc\forMSWin\fzf.exe $Env:LOCALAPPDATA\Microsoft\WindowsApps
fzf --version

#=> 0 install with winget
winget add fzf

#=> 1 fzf.exe out of WindowsApps
ri $Env:LOCALAPPDATA\Microsoft\WindowsApps\fzf.exe

#=> 0 remove with winget
winget rm fzf

