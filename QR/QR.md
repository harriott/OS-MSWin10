vim: nospell:

    PS> m4ps0 -s

    $HADR\vlc\vlcrc
    Adobe Acrobat Reader DC > Shift+Ctrl+Minus -> rotate left
    $HADL\Microsoft\WindowsApps
    cpan -l > $MSWml\cpanList.txt
    yt-dlp -U  # update inplace

- AutoHotkey `$MSn\AutoHotkey\AZERTY.ahk`
- `ctrl+m` on selected text opens it in `LanguageTool`
- Task Scheduler: `taskschd.msc`
- WinRE

# build
    $MSWml
    $MSWin10
    pt '$emd' $Drpbx\JH
    pt '$Pr0' $Drpbx\JH

# hw - DVD
    DVDFab 13 > Copier > Disque entier > DVD9 > ($HOME\Documents\DVDFab\DVDFab13\Output) > Démarrer

## Shrink
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
- `ctrl+t` Insert text, but only up to 72pt
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

## AZERTY
- `=`/`-` zoom in/out
- `ctrl++` rotate right

# text wrangling
`Notepad++`: `alt+p > Préférences...`

## Emacs
    $HADR\.emacs.d\init.el
    C:\Emacs\emacs-28.1\bin\emacs.exe -nw
    ~\AppData\Roaming\.spacemacs

## Vim
    & $CPF\Neovim\bin\nvim.exe -h
    C:\Vim\vim91\gvim.exe
    C:\Vim\vim91\vim.exe -?
    C:\Vim\vim91\vim.exe --version
    where.exe nvim.exe

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
`ctrl+win+o` toggles visual keyboard in current language

### change language
- `shift+alt`
- `win+space` with pop-up

## File Explorer
- `Alt+d`/`ctrl+l` (& `f4`) le chemin d’accès > `bash`/`pwsh`/`wt` Enter
- `Alt+p` toggle preview panel
- `Ctrl+F1` toggle the ribbon
- `Ctrl+N` new directory
- `Ctrl+space` toggle PowerToys Peek
- Explorateur de fichiers

## internetworking
    whois 8.8.8.8

- Skype: `Ctrl+,` = `Menu > Settings`
- `WiFi icon > Properties` (or `Settings > Network & Internet > WiFi > Hardware properties`)

### Windows Defender Firewall
    control firewall.cpl  # Control Panel > All Control Panel Items > Windows Defender Firewall
    wf (= C:\WINDOWS\system32\wf.msc) # Windows Defender Firewall with Advanced Security, where Rules can be seen

## magnifier
- `win +` turn on, zoom in
- `win+esc` turn off

## Microsoft Defender Antivirus
    PS> get-mpthreatdetection
    APS> start-mpwdoscan

- `Msmpeng.exe` = `Microsoft Malaware Protection Engine` for which there's little info and I can't change the `affinity`
- requires a Windows Recovery partition to be present

## Registry Editor
    C:\Windows\System32\regedt32.exe
    Win+r > regedit

`Éditeur du Registre`

## snapping
if done when eg  AltSnap's default  AutoSnap=2, then  win+arrow  actions are deadened

## Start Menus
    sl "$HADR\Microsoft\Windows\Start Menu\Programs"
    Win+r > shell:common programs
    Win+r > shell:programs
    Win+r > shell:startup => user Start-up

## Task Manager
    C:\WINDOWS\system32\Taskmgr.exe
    ctrl+shift+esc

Gestionnaire de tâches

## win+r
- `devmgmt.msc` = `Device Manager` = `Gestionnaire de périphériques`
- `services.msc` = `Services`
- `taskschd.msc` = `Task Scheduler`

## Windows Package Manager
- https://winstall.app/
- WinGet Client

## WSL
    [[ $(uname -r) =~ 'microsoft' ]] && o yes

- GUI apps
- Windows Subsystem for Linux

### nodes, from Windows
    \\wsl$\Ubuntu-24.04\etc\wsl.conf
    \\wsl$\Ubuntu-24.04\home\jo\.mbsyncrc
    g \\wsl$\Ubuntu-24.04\etc\ranger\config
    g \\wsl$\Ubuntu-24.04\run\systemd\system
    g \\wsl$\Ubuntu-24.04\usr\bin

- can't access these from `Telescope`, so `:MRU wsl$`
- `\\wsl$\Ubuntu-24.04\home\jo\Play0`
    - not navigable by `oil.nvim`
    - not seen by `nvim-tree.lua`

#### Bash
    \\wsl$\Ubuntu-24.04\etc\bash_completion.d\git-prompt
    \\wsl$\Ubuntu-24.04\home\jo\.bash_history

`\\wsl$\Ubuntu-24.04\etc\skel` has Bash configuration defaults

#### plocate
    g \\wsl$\Ubuntu-24.04\var\lib\plocate
    \\wsl$\Ubuntu-24.04\etc\updatedb.conf

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
    winget find ubuntu

#### wslu
    wslfetch  # alternative to  neofetch
    wslsys  # system info
    wslvar -L  # --getshell
    wslvar -S  # --getsys
    wslview https://wslutiliti.es/wslu/man/wslview.html

