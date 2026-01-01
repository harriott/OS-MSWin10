vim: nospell:

    $MSWin10\QR\cli.md
    win32yank -o  # returns what's in the clipboard

    ~\AppData\Roaming\Vifm\vifmrc

    chkdsk d: /f
    code-minimap --version
    code-minimap -h  # --help
    tasklist

- Ghostscript releases
- `intl.cpl` (= `Panneau de configuration > Région`)

# Command Prompt
    dir * /x
    pwsh -nop -c ls
    type <file_to_list>

- in Explorer: `Alt+D > cmd > Enter`
- `PS> cmd` then `exit`

## environment variables
    echo %HOMEPATH%
    echo %LOCALAPPDATA%  # C:\Users\<user>\AppData\Local
    echo %username%
    echo %userprofile%
        echo %AppData%
        echo %localappdata%
    set  # shows them all

can paste these into `File Explorer`

### computer name
    echo %computername%
    hostname

### path
    echo %path:;=&echo.%  # %PATH% on separate lines
    powershell -nop -c ($env:Path).split(';')
    pwsh -nop -c ($env:Path).split(';')

# console code page
    chcp [65001]
    REG query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont"

# console size show
    [console]::WindowHeight
    [console]::WindowWidth

# file manage - Robocopy
    ROBOCOPY.exe

- `/e` subfolders, including empty
- `/fft` 2-second granularity (FAT File Times)
- `/l` list only (simulate)
- `/mir` `/e /purge` (mirror)
- `/np` no progress report
- once the source/target are specified, exclude some directories: `/xd '.git' /xd '*packs-*'`
- `/tee` output to console as well as log file

# file manage - Yazi
    where.exe yazi

Won't previez anything...

# fzf
    alt+c
    fzf -h
    fzf --version
    where.exe fzf

# The Platinum Searcher
    pt /version
    pt text_to_find .

output is simplified when redirected to a file

## in $Drpbx\JH
    pt '$core' .
    pt '$DJH' .
    pt '$JH' .
    pt 'notmatch' .

### `$core`
    pt '$MSWin10' .
    pt 's~~$' .

# schtasks
    schtasks  # schtasks /query  summary of all tasks
    schtasks /query /fo LIST /v  # huge detailed list

scheduled tasks

## AltSnap
    schtasks /delete /tn "AltSnap onlogon" /f
    schtasks /query /tn "AltSnap onlogon" /fo LIST /v

# Windows Loupe
- `ctrl+alt+flèche` bouger
- `ctrl+alt+f/l` basculer en affichage
- `win+=` activer la loupe
    - `win+=\-` zoom avant/arrière
- `win+ctrl+m` paramètres de la loupe
- `win+esc` désactiver la loupe

# WT
- 24-bit colour depth = true color
- in Explorer: `Alt+D > wt > Enter`
- `win+;` emojis
- `win+r > wt` opens `wt` on `~`
- `Windows Terminal`

## Settings
    Startup > Launch on machine startup

### key-binds
    Settings > Actions

- `ctrl+,` = `Settings`
- `ctrl+shift+n` new window
- `ctrl+shift+p` commands

#### panes
- `alt+D` duplicate pane right
- `alt+_` split pane below (AZERTY `alt+6`)
- `alt++` split pane right
- `alt+arrow` move focus
- `alt+shift+-` = `split down`
- `alt+shift+arrow` = adjusts pane size
- `ctrl+shift+w` close pane

No way to throw a split out to full...

#### pane contents
- `ctrl+c` copy text
- `ctrl+shift+a` select all
- `ctrl+shift+f` find

##### scrolls
- `ctrl+shift+End`
- `ctrl+shift+Home`
- `ctrl+shift+PgDn`
- `ctrl+shift+PgUp`

#### tabs
- `ctrl+shift+d` new tab in same directory (`$MSWin10\PSProfile.ps1`)
- `ctrl+shift+t` new tab
- `ctrl(+Shift)+Tab` move to next (previous) tab

### settings.json
    cpi $HADL\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json $MSWml\WT-settings.json

default actions don't show, but when I binned annoying `alt+enter` & `<f11>` "Baculer en plein écran", they show as `unbound`

