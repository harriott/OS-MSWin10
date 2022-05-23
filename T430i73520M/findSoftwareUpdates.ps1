# vim: set fdl=1:

# Joseph Harriott
# find software updates

[System.Console]::ForegroundColor = 'White'
"Installed software versions:"
[System.Console]::ResetColor()
$v = fzf --version; " fzf v$v"
''

[System.Console]::ForegroundColor = 'White'
$reply = Read-Host 'o to see versions online'
[System.Console]::ResetColor()
if ($reply -eq 'o') {
  start microsoft-edge:https://github.com/junegunn/fzf-bin/releases
}

