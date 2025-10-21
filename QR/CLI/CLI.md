vim: nospell:

    $MSWin10\QR\cli.md
    win32yank -o  # returns what's in the clipboard

    ~\AppData\Roaming\Vifm\vifmrc

`intl.cpl` (= `Panneau de configuration > Région`)

# console code page
    chcp [65001]
    REG query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont"

# console size show
    [console]::WindowHeight
    [console]::WindowWidth

# encoding
    ~/.rustup/settings.toml
    $MSWin10\nodes\gitconfig
    C:\Git\usr\bin\perl.exe -v
    C:\msys64\usr\bin\perl.exe -v
    java -jar C:\LanguageTool\languagetool-commandline.jar -h
    java -jar $ITscc\CP\LanguageTool\languagetool-commandline.jar -h

## Command Prompt
    dir * /x
    pwsh -nop -c ls

- in Explorer: `Alt+D > cmd > Enter`
- `PS> cmd` then `exit`

### environment variables
    echo %LOCALAPPDATA%  # C:\Users\<user>\AppData\Local
    echo %username%
    echo %userprofile%
        echo %AppData%
        echo %localappdata%
    set  # shows them all

can paste these into `File Explorer`

#### computer name
    echo %computername%
    hostname

#### path
    echo %path:;=&echo.%  # %PATH% on separate lines
    powershell -nop -c ($env:Path).split(';')
    pwsh -nop -c ($env:Path).split(';')

## MiKTeX
    miktex fndb refresh
    $HADL\MiKTeX\miktex\log\initexmf.log
    $HADL\MiKTeX\miktex\log\miktex-makemf.log
    $HADL\Programs\MiKTeX\miktex\config\xelatex.ini

## npm
    g $HADL\npm-cache\_npx
    g $HADR\npm

## Python
    g $HADL\Programs\Python  # winget install
    g $HADR\Python

## Perl
    where.exe perl

### Strawberry
    C:\Strawberry\perl\bin\perl.exe -v
    g $home\.cpanm

## Windows Package Manager
    g $HADL\microsoft\winget\packages
    winget --info
    winget add SumatraPDF -h -l C:\SumatraPDF # install (--location, --silent)
    winget find powershell
    winget update --all
    winget update google.chrome
    winget rm google.chrome  # uninstall

- `-h` (`--silent`)
- `Winget`

## Windows PowerShell - file formats
    PowerShell command | out-file <file> -encoding utf8BOM  # detected as utf-8
    PowerShell command > <file>  # detected as latin1

## Windows PowerShell - modules
    get-installedmodule
    get-module -listavailable  # details, including old
    C:\Users\jharr\Documents\WindowsPowerShell\Modules
    C:\Users\jnbh\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

### paths
    $Env:PSModulePath -split ';'
    ~\Documents\WindowsPowerShell\Modules

# file manage - Robocopy
    ROBOCOPY.exe

- `/E` subfolders, including empty
- `/fft` 2-second granularity (FAT File Times)
- `/l` list only (simulate)
- `/mir` `/e /purge` (mirror)
- once the source/target are specified, exclude some directories: `/xd '.git' /xd '*packs-*'`
- `/tee` output to console as well as log file

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

#### pane contents
- `ctrl+c` copy text
- `ctrl+shift+a` select all
- `ctrl+shift+f` find

##### scrolls
- `ctrl+shift+End`
- `ctrl+shift+Home`
- `ctrl+shift+PgDn`
- `ctrl+shift+PgUp`

#### panes
- `alt+D` duplicate pane right
- `alt+_` split pane below (AZERTY `alt+6`)
- `alt++` split pane right
- `alt+arrow` move focus
- `alt+shift+-` = `split down`
- `alt+shift+arrow` = adjusts pane size
- `ctrl+shift+w` close pane

No way to throw a split out to full...

#### tabs
- `ctrl+shift+d` new tab in same directory (`$MSWin10\PSProfile.ps1`)
- `ctrl+shift+t` new tab
- `ctrl(+Shift)+Tab` move to next (previous) tab

### settings.json
    cpi $HADL\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json $MSWml\WT-settings.json

default actions don't show, but when I binned annoying `alt+enter` & `<f11>` "Baculer en plein écran", they show as `unbound`

