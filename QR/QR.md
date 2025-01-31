vim: nospell:

    PS> m4ps0 -s

    $HADR\vlc\vlcrc
    Adobe Acrobat Reader DC > Shift+Ctrl+Minus -> rotate left
    $HADL\Microsoft\WindowsApps
    cpan -l > $machLg\cpanList.txt
    yt-dlp -U  # update inplace

- AutoHotkey `$MSn\AutoHotkey\AZERTY.ahk`
- `ctrl+m` on selected text opens it in `LanguageTool`
- Task Scheduler: `taskschd.msc`
- WinRE

# build
    $machLg
    $MSWin10
    pt '$emd' $Drpbx\JH
    pt '$Pr0' $Drpbx\JH

# CLI
    $MSWin10\QR\cli.md
    win32yank -o  # returns what's in the clipboard

    ~\AppData\Roaming\Vifm\vifmrc

`intl.cpl` (= `Panneau de configuration > Région`)

## console code page
    chcp [65001]
    REG query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont"

## console size show
    [console]::WindowHeight
    [console]::WindowWidth

## encoding
    $MSwin10\nodes\gitconfig
    C:\Git\usr\bin\perl.exe -v
    C:\msys64\usr\bin\perl.exe -v
    java -jar C:\LanguageTool\languagetool-commandline.jar -h
    java -jar $ITscc\CP\LanguageTool\languagetool-commandline.jar -h

### Command Prompt
    dir * /x
    pwsh -nop -c ls

- in Explorer: `Alt+D > cmd > Enter`
- `PS> cmd` then `exit`

#### environment variables
    echo %LOCALAPPDATA%  # C:\Users\<user>\AppData\Local
    echo %username%
    echo %userprofile%
        echo %appdata%
        echo %localappdata%
    set  # shows them all

##### computer name
    echo %computername%
    hostname

##### path
    echo %path:;=&echo.%  # %PATH% on separate lines
    powershell -nop -c ($env:Path).split(';')
    pwsh -nop -c ($env:Path).split(';')

### MiKTeX
    miktex fndb refresh
    $HADL\MiKTeX\miktex\log\initexmf.log
    $HADL\MiKTeX\miktex\log\miktex-makemf.log
    $HADL\Programs\MiKTeX\miktex\config\xelatex.ini

### npm
    g $HADL\npm-cache\_npx
    g $HADR\npm

### Python
    g $HADL\Programs\Python  # winget install
    g $HADR\Python

### Strawberry Perl
    C:\Strawberry\perl\bin\perl.exe -v
    g $home\.cpanm

### Windows Package Manager
    g $HADL\microsoft\winget\packages
    winget --info
    winget add SumatraPDF -h -l C:\SumatraPDF # install (--location, --silent)
    winget find powershell
    winget update --all
    winget update google.chrome
    winget rm google.chrome  # uninstall

- `-h` (`--silent`)
- `Winget`

### Windows PowerShell - file formats
    PowerShell command | out-file <file> -encoding utf8BOM  # detected as utf-8
    PowerShell command > <file>  # detected as latin1

### Windows PowerShell - modules
    get-installedmodule
    get-module -listavailable  # details, including old
    C:\Users\jharr\Documents\WindowsPowerShell\Modules
    C:\Users\jnbh\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

#### paths
    $Env:PSModulePath -split ';'
    ~\Documents\WindowsPowerShell\Modules

## file manage - lf
    $HADL\lf\lfrc

by gokcehan

## file manage - robocopy
    ROBOCOPY.exe

- `/E` subfolders, including empty
- `/fft` 2-second granularity (FAT File Times)
- `/l` list only (simulate)
- `/mir` `/e /purge` (mirror)
- once the source/target are specified, exclude some directories: `/xd '.git' /xd '*packs-*'`
- `/tee` output to console as well as log file

## fzf
    alt+c
    fzf -h
    fzf --version
    where.exe fzf

## The Platinum Searcher
    pt /version
    pt text_to_find .

output is simplified when redirected to a file

### in $Drpbx\JH
    pt '$core' .
    pt '$DJH' .
    pt '$JH' .
    pt 'notmatch' .

#### `$core`
    pt '$MSWin10' .
    pt 's~~$' .

## Windows Loupe
- `ctrl+alt+flèche` bouger
- `ctrl+alt+f/l` basculer en affichage
- `win+=` activer la loupe
    - `win+=\-` zoom avant/arrière
- `win+ctrl+m` paramètres de la loupe
- `win+esc` désactiver la loupe

## Windows Terminal
- in Explorer: `Alt+D > wt > Enter`
- `win+;` emojis
- `win+r > wt` opens `wt` on `~`

### Settings
    Startup > Launch on machine startup

#### key-binds
    Settings > Actions

- `alt+D` duplicate pane right
- `alt+_` split pane below (AZERTY `alt+6`)
- `alt++` split pane right
- `alt+arrow` move focus
- `alt+shift+-` = `split down`
- `alt+shift+arrow` = adjusts pane size
- `ctrl+,` = `Settings`
- `ctrl+c` copy text
- `ctrl+shift+d` new tab in same directory (`$MSWin10\PSProfile.ps1`)
- `ctrl+shift+f` find
- `ctrl+shift+n` new window
- `ctrl+shift+p` commands
- `ctrl+shift+t` new tab
- `ctrl+shift+w` close pane
- `ctrl+shift+PgUp` scroll up a page
- `ctrl(+Shift)+Tab` move to next (previous) tab

#### settings.json
    cpi $HADL\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json $machLg\WT-settings.json

default actions don't show, but when I binned annoying `alt+enter` & `<f11>` "Baculer en plein écran", they show as `unbound`

## WSL
Windows Subsystem for Linux

### nodes, from Windows
    \\wsl$\Ubuntu\etc\wsl.conf
    \\wsl$\Ubuntu-24.04\home\jo\.mbsyncrc
    g \\wsl$\Ubuntu\etc\ranger\config
    g \\wsl$\Ubuntu\run\systemd\system
    g \\wsl$\Ubuntu\usr\bin

- can't access these from `Telescope`, so `:MRU wsl$`
- `\\wsl$\Ubuntu\home\jo\Play0`
    - not navigable by `oil.nvim`
    - not seen by `nvim-tree.lua`

#### Bash
    \\wsl$\Ubuntu\etc\bash_completion.d\git-prompt
    \\wsl$\Ubuntu\home\jo\.bash_history
    \\wsl$\Ubuntu\home\jo\.bash_profile

`\\wsl$\Ubuntu\etc\skel` has Bash configuration defaults

#### plocate
    g \\wsl$\Ubuntu\var\lib\plocate
    \\wsl$\Ubuntu\etc\updatedb.conf

#### repositories
    \\wsl$\Ubuntu-24.04\etc\apt\sources.list.d\ubuntu.sources

##### v22.04
    \\wsl$\Ubuntu\etc\apt\sources.list.d\ubuntu-esm-apps.list
    \\wsl$\Ubuntu\etc\apt\sources.list.d\ubuntu-esm-infra.list

### Ubuntu
    /mnt/c/vim/vim91/gvim.exe &
    highlight --syntax=bash ~/.bash_history -O ansi
    o hello | clip.exe  # arrives in Ditto
    pwsh.exe -nop -c start .
    pwsh.exe -nop -c Get-ExecutionPolicy
    win32yank.exe -o  # returns what's in the clipboard

#### wslu
    wslfetch  # alternative to  neofetch
    wslsys  # system info
    wslvar -L  # --getshell
    wslvar -S  # --getsys
    wslview https://wslutiliti.es/wslu/man/wslview.html

# hw - DVD Shrink
    Backup! > Create VIDEO_TS and AUDIO_TS subfolders off
    Compressioin Settings > Custom Ratio > slider to left

repeat until small enough

# hw - storage
    Properties > Tools > Error checking > Check (= Error Checking) > Scan and repair drive

## name limitations
260 characters

### forbidden characters
    < > : " / \ | ?  *

### storage - reserved NT names
    aux com1 com2 com3 com4 com5 com6 com7 com8 com9 con nul prn lpt1 lpt2 lpt3 lpt4 lpt5 lpt6 lpt7 lpt8 lpt9

# imagey
ExifTool by Phil Harvey

## FastStone
- `0` fits to screen, `1` - `9` zoom in (corresponding AZERTY principal keymaps work)
- `f`, `f11` = toggle full screen
- `f12` = Paramètres
- `h`/`v` invert horizontally/veritcally
- `i` image properties
- `w` = open in `File Explorer`
- `$JHt/IT/MSWin/Imagey/i6l-FSSettings.db` = last saved, for `PaperSizeList`

## IrfanView
`Consolas` can handle €

### commands
- `ctrl+shift+a` Acquire/Batch Scanning
- `ctrl+s` = `Save (original folder)`
- `ctrl+t` Insert text
- `ctrl+x` = `Cut - selection`
- `p` Properties/Settings
- `R` Reopen file
- `r` rotate right

# documenting - LaTeX
    g $ITscr\CP\TeX

## Polyglossia
    \setmainfont{Segoe Print}
    \setmainfont{Segoe Script}
    \setmainfont{Trebuchet MS}

# documenting - PDF - Sumatra
- `ctrl+6` view single pages (`ctrl+-` on AZERTY)
- `ctrl+7` view facing pages (`ctrl+è` on AZERTY)
- `ctrl+8` view book mode
    - `b` fip page (forward only)
- `ctrl+d` properties
- `ctrl+k` command palette
- `ctrl+shift+tab` go to previous tab
- `ctrl+tab` go to next tab
- `f12` = Afficher les signets
- `i` invert colours
- `r` reload
- `z` toggle zoom between Fit Page, Fit Width, Fit Content

# text wrangling
`Notepad++`: `alt+p > Préférences...`

## Emacs
    $HADR\.emacs.d\init.el
    C:\Emacs\emacs-28.1\bin\emacs.exe -nw
    ~\AppData\Roaming\.spacemacs

## Vim
    C:\Vim\vim91\gvim.exe
    C:\Vim\vim91\vim.exe -?
    C:\Vim\vim91\vim.exe --version
    g $lazy
    g 'C:\Program Files\Neovim\share\nvim\runtime'g 'C:\Program Files\Neovim\share\nvim\runtime'
    $ProgramFiles\Neovim\share\nvim\runtime\mswin.vim

# WAN
    cp $HADR\Thunderbird\profiles.ini $HADR\Thunderbird\profilesOld.ini

## browser - Microsoft Edge
    edge://extensions/
    edge://favorites/
    edge://settings
    edge://settings/accessibility > Clavier > f7 caret
    edge://settings/privacy
    edge://settings/profiles/sync
    edge://settings/startHomeNTP > Ouvrir ces pagges : https://calendar.google.com/

- `alt+f` (= `Parmètres et plus`)
    - `l` (= `Outils supplémentaires`)
        - `o` (= `Outils de développement`)
- `ctrl+.` on AZERTY toggles Copilot sidebar
- `ctrl+I` (= `Outils de développement`)
- `ctrl+j` (= `Téléchargements`)
- `ctrl+p` (= `Imprimer`) includes save as PDF
- `ctrl+u` (= `right-click > View page source`) is searchable
- `f12` toggles last of DevTools
- Secure Network

### developer tools
    ••• > More tools > Developer tools > Elements

`ctrl+shift+i` toggles

### Extensions
    ••• > Extensions

- jigsaw icon
- `Manage` = `edge://extensions`

### Favourites
    ctrl+shift+o
    edge://favorites/
    ••• > Open favourites page > ••• > Sort

star icon

## browsers - Vivaldi
    Alt+P (= Settings)
    Alt+P > Search > [ Google up to top and Set as Default , DuckDuckGo next, Wikipedia third ]
    Ctrl+B -> Manage Bookmarks

`Ctrl+Shift+E` Extensions

# Windows
    regedit
    sl C:\Windows\Fonts

- `Control Panel > Programs and Features`
- `shift+win+/` PowerToys general Win10 Shortcut Guide
- `System Volume Information` can be Deleted
- `win+a` action center, brightness at bottom (Dévélopper)
- `win+C` PowerToys Color Picker
- `win+H` PowerToys mouse pointer crosshairs
- `win+S` Snipping
- `win+l` lock screen
- `win+x` > `t` = `Gestion des disques`

## input
`ctrl+win+o` tgggles visual keyboard in current language

### change language
- `shift+alt`
- `win+space` with pop-up

## File Explorer
- `alt+d`/`ctrl+l` (& `f4`) le chemin d’accès > `bash`/`pwsh`/`wt` Enter
- `alt+p` toggle preview panel
- `ctrl+N` new directory
- `ctrl+space` toggle PowerToys Peek
- Explorateur de fichiers

## internetworking
    whois 8.8.8.8

- Skype: `Ctrl+,` = `Menu > Settings`
- `WiFi icon > Properties` (or `Settings > Network & Internet > WiFi > Hardware properties`)

### Windows Defender Firewall
    control firewall.cpl  # Control Panel > All Control Panel Items > Windows Defender Firewall
    wf (= C:\WINDOWS\system32\wf.msc) # Windows Defender Firewall with Advanced Security, where Rules can be seen

## Microsoft Defender Antivirus
    PS> get-mpthreatdetection
    APS> start-mpwdoscan

requires a Windows Recovery partition to be present

## snapping
if done when eg  AltSnap's default  AutoSnap=2, win+arrow  actions are deadened

## Start Menus
    cd "$Env:AppData\Microsoft\Windows\Start Menu\Programs"
    Win+r > shell:common programs
    Win+r > shell:programs
    Win+r > shell:startup => user Start-up

## Task Manager
    C:\WINDOWS\system32\Taskmgr.exe
    ctrl+shift+esc

Gestionnaire de tâches

## win+r
- `devmgmt.msc` = Device Manager = Gestionnaire de périphériques
- `taskschd.msc` = Task Scheduler

