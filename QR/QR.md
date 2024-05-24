vim: nospell:

    PS> m4ps0 -s

    Adobe Acrobat Reader DC > Shift+Ctrl+Minus -> rotate left
    C:\Users\troin\AppData\Local\Microsoft\WindowsApps
    cpan -l > $machLg\cpanList.txt
    sl $JCop\IT-handy\CP\TeX\LaTeX\structure\classes\memoir
    yt-dlp -U  # update inplace

- AutoHotkey `$machBld\user\jo.ahk`
- `ctrl+m` on selected text opens it in `LanguageTool`
- Task Scheduler: `taskschd.msc`
- WinRE

# build
    $machBld
    $machLg
    pt '$emd' $Drpbx\JH
    pt '$Pr0' $Drpbx\JH

# imagey
ExifTool by Phil Harvey

## FastStone
- `f`, `f11` = toggle full screen
- `f12` = Paramètres
- `w` = open in `File Explorer`

## IrfanView
- `ctrl+shift+a` Acquire/Batch Scanning
- `ctrl+t` Insert text
- `p` Properties/Settings
- `R` Reopen file
- `r` rotate right

Consolas can handle €

# LaTeX
    v $home\Downloads $core\IT_stack\copied-reference\CP\TeX

## Polyglossia
    \setmainfont{Segoe Print}
    \setmainfont{Segoe Script}
    \setmainfont{Trebuchet MS}

# Microsoft Edge
`ctrl+.` on AZERTY toggles Copilot sidebar
`ctrl+u` (= `right-click > View page source`) is searchable

## Extensions
`Manage` = `edge://extensions`

### Extensions
    ••• > Extensions

jigsaw icon

### developer tools
    ••• > More tools > Developer tools > Elements

`ctrl+shift+i` toggles

## Favourites
    edge://favorites/
    ••• > Open favourites page > ••• > Sort

### Favourites
    ctrl+shift+o

star icon

# browsers
KeePassXC: Getting Started Guide

## Chromium-based
    chrome://apps/
    chrome://plugins/
    chrome://system > extensions > Expand -> a list of Extensions
    ctrl+h -> chrome://history
    ctrl+Shft+O (= Bookmarks) > Organise > Export
    ctrl+u => view page source in new tab

### Edge
    ctrl+j -> open downloads pane

## Firefox
    about:config > caret
    about:plugins
    about:preferences#general
    about:preferences#sync
    alt > e (= Edit) > n (= Settings)
    ctrl+p > Destination > Save to PDF > Save
    ctrl+shft+b (= toggle Bookmarks Toolbar)
    ctrl+shft+o (= Library)

## Vivaldi
    Alt+P (= Settings)
    Alt+P > Search > [ Google up to top and Set as Default , DuckDuckGo next, Wikipedia third ]
    Ctrl+B -> Manage Bookmarks

# PDF
    gsp  # Ghostscript convert pdf to png

## Sumatra PDF
- `ctrl+6` view single pages (`ctrl+-` on AZERTY)
- `ctrl+7` view facing pages (`ctrl+è` on AZERTY)
- `ctrl+d` properties
- `ctrl+k` command palette
- `ctrl+shift+tab` go to previous tab
- `ctrl+tab` go to next tab
- `f12` = Afficher les signets
- `r` reload
- `z` toggle zoom between Fit Page, Fit Width, Fit Content

# storage
    Properties > Tools > Error checking > Check (= Error Checking) > Scan and repair drive

## name limitations
260 characters

### forbidden characters
    < > : " / \ | ?  *

### storage - reserved NT names
    aux com1 com2 com3 com4 com5 com6 com7 com8 com9 con nul prn lpt1 lpt2 lpt3 lpt4 lpt5 lpt6 lpt7 lpt8 lpt9

# text wrangling
`Notepad++`: `alt+p > Préférences...`

## Emacs
    C:\Emacs\emacs-28.1\bin\emacs.exe -nw
    C:\Users\troin\AppData\Roaming\.emacs.d
    sl C:\Users\troin\AppData\Roaming\.emacs.d
    ~\AppData\Roaming\.spacemacs

## Vim
    C:\Vim\vim91\vim.exe -?
    g $lazy
    g 'C:\Program Files\Neovim\share\nvim\runtime'
    $ProgramFiles\Neovim\share\nvim\runtime\mswin.vim

# Vivaldi
- `Alt+P` Settings
- `Ctrl+Shift+E` Extensions

# Windows
    regedit
    sl C:\Windows\Fonts

- `Control Panel > Programs and Features`
- `shift+win+/` PowerToys general Win10 Shortcut Guide
- `System Volume Information` can be Deleted
- `win+C` PowerToys Color Picker
- `win+H` PowerToys mouse pointer crosshairs
- `win+S` Snipping
- `win+l` lock screen
- `win+r` = `taskschd.msc` Task Scheduler
- `win+x` > `t` = `Gestion des disques`

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

## Start Menus
    cd "$Env:AppData\Microsoft\Windows\Start Menu\Programs"
    Win+r > shell:common programs
    Win+r > shell:programs
    Win+r > shell:startup => user Start-up

## Task Manager
    C:\WINDOWS\system32\Taskmgr.exe

Gestionnaire de tâches

## Windows Subsystem for Linux
    \\wsl$\Ubuntu\etc\wsl.conf
    \\wsl$\Ubuntu\home\jo\.bash_history

`\\wsl$\Ubuntu\etc\skel` has Bash configuration defaults

