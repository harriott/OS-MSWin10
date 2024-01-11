# vim: set fdl=1:

# Joseph Harriott
# find software updates

SCFCW; "Installed software versions:"; SCRC
$v = fzf --version; " fzf v$v"
''

SCFCW; $reply = Read-Host 'o to see versions online'; SCRC
if ($reply -eq 'o') { start microsoft-edge:https://github.com/junegunn/fzf-bin/releases }

