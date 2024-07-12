vim: nospell:

    $MSWin10\QR\cli.md

    ~\AppData\Roaming\Vifm\vifmrc

`intl.cpl` (= `Panneau de configuration > Région`)

# console code page
    chcp [65001]
    REG query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont"

# console size show
    [console]::WindowHeight
    [console]::WindowWidth

# encoding
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
        echo %appdata%
        echo %localappdata%
    set  # shows them all

#### computer name
    echo %computername%
    hostname

#### path
    echo %path:;=&echo.%  # %PATH% on separate lines
    powershell -Command ($env:Path).split(';')
    pwsh -Command ($env:Path).split(';')

## MiKTeX
    miktex fndb refresh
    ~\AppData\Local\MiKTeX\miktex\log\initexmf.log
    ~\AppData\Local\MiKTeX\miktex\log\miktex-makemf.log
    ~\AppData\Local\Programs\MiKTeX\miktex\config\xelatex.ini

## npm
    g $HOME\AppData\Local\npm-cache\_npx
    g $HOME\AppData\Roaming\npm

## PowerShell
    $ITstack\MSWin\PowerShell\Scratch.ps1
    $myinvocation.mycommand.name  # = the script's name
    $MSwin10\gac.ps1  # to explore all commands
    '"Hello world"'
    1..3
    fd -tf -u index.lock | %{ri $_}
    get-volume  # reports partitions
    less <someFile>
    foreach($element in 1..3){ $element }
    sleep 1

- `$_` = `$PSItem` = current object in the pipeline object
- `Alt > Space > E > L > up/down` to scroll, then `Esc`
- `continue` returns to the top of a loop a `trap` or a `switch`
- redirection operators: `>`, `>>`, `2>`, `2>>`, `2>&1`

### alias manage
limited to single commands

#### ?-Alias
    gal -Definition Get-ChildItem
    gal h*
    gal | sort Source | ft -view Source
    nal <alias> <string>
    sal <alias> <string>

### colour
    & "$ITstack\MSWin\PowerShell\colours\ConsoleColor.ps1"
    & "$ITstack\MSWin\PowerShell\colours\LindbergColors.ps1"
    & "$onGH\misc\Colors.ps1"
    [enum]::getvalues([type]'system.consolecolor').ForEach{@{$_ = $_.value__}}
    [System.Enum]::GetValues('ConsoleColor') | %{ write-host $_ -ForegroundColor $_ }
    write-color -text 'red ', 'green ', 'yellow ' -color red,green,yellow  # pswritecolor

#### $PSStyle
    write-host "$($PSStyle.foreground.magenta)$($PSStyle.background.white)magenta_on_white$($PSStyle.reset)"  # no bleeding!

##### view colours
    $PSStyle.Background
    $PSStyle.Foreground

### data
    $array | sort
    $x.GetType()
    sv var $true; $var

#### arrays
    $a = 1,'a',2,'b'; $a[1]; $a[-1]; $a.length
    $a = @(); $a += 'first'; $a += 'second'
    foreach ($element in $myArray) {$element}
    Format-Custom -InputObject $array -Expand CoreOnly  # displays structure

#### strings
    $b=$b+'o'
    $s='stringROD'; $s.substring(0, $s.length -3)
    $string.length
    $string.trim()  # removes whitespaces (including newlines) from ends
    "Hello".Replace('l', 'x').Replace('H', 'Y')
    'a'.equals('b')
    'abcdefg'.substring(2,3)  # 3 characters starting from index 2 (= 3rd character)
    'IF' -match '^t$|^f$'
    'me'+'et'
    [string]$pwd
    if ( !$y ) { 'no' }
    format-string powershell -randomize
    if ( '5' -ne '4' ) { '5 is not 4' }

regex: `\w` = a-z, A-Z, 0-9, _

### datetime
    [system.timezoneinfo]::getsystemtimezones() | out-gridview
    get-timezone -listavailable | out-gridview
    Get-TZData Australia/Hobart

#### get-date
    $n = get-date -f yyyyMMddhhmmss
    (get-date).day  # of month
    (get-date).tostring("yyMMdd-HHmmss")

no standard aliases

### executables
    (gcm python | select version | ft -HideTableHeaders | out-string).trim()
    (gp hklm:\software\microsoft\windows\currentversion\uninstall\* ).displayname | sort  # lists removable x64 programs
    cd 'C:\Program Files'
    C:\MozillaThunderbird\thunderbird.exe -addressbook
    C:\Windows\explorer.exe "microsoft-edge:searchterm"
    get-startapps  # lists AppIDs
    explorer shell:Appsfolder  # Applications
    start <somefile>

#### get-command
    gcm explorer
    gcm lsd
    gcm python | fl *
(gcm python).version
gcm python | select -expand version

#### Microsoft Visual Studio parts
    & "${env:programfiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe" -?

otherwise little sign of them

#### PowerShell
    $programfiles\PowerShell\7\powershell.config.json
    pwsh -? | less
    pwsh -nol  # -NoLogo
    pwsh -nop  # -NoProfile
    saps pwsh -verb runas  # Administrator

#### Windows PowerShell
    powershell -noprofile  #  runs  Windows PowerShell
    saps powershell -verb runas  # Administrator

#### where.exe
    where.exe bash
    where.exe gpg
    where.exe ffmpeg
    where.exe pwsh
    where.exe python
    where.exe sumatrapdf
    where.exe where.exe

doesn't find executables in `~\AppData\`

### file contents
    (gc $file | select -skip 3) | seco $file  # removes first 3 lines
    (gc $file_with_whitespaces_at_ends_of_lines).trim() | seco trimmed.txt

### file manage
    ii .  # invoke Explorer on WD
    lsd --help
    mv file dir/file -force
    sl ~ (= set-location C:\Users\$ENV:UserName")

#### investigations
    bat <textFile>  # with beautiful formatting and less paging
    dw -?
    dw  # directory counts
    f  # fzf preview files with bat
    get-filehash <fileForWhichYouWantSHA256>
    gl  # pwd = get-location
    if ( ! ( test-path 'dir' ) ) { ni -name 'dir' -type directory }
    pc -a -l -t  # includes hidden & time sorted
    stringInVims "string"

##### by extension
    cex
    Get-FileExtensionInfo -r
    tomalak

##### gci
    (ls -s).count
    dir
    gal ls
    list
    ls * | select FullName
    ls * | select Name
    ls -s -depth 1  # including contents of subdirectories
    ls -s -i i1*,i2*,i3*
    ls -s -i '* (* conflicted copy *' |%{echo $_.fullname} | ri
    ls -s | ? Name -match <regex>
    ls -directory -s  # recursive list

###### list of names
    ls -name
    (ls).fullname
    (ls).name

###### PSAnsiMap
    ls . | ft -view ansi  # overrides Terminal-Icons
    Get-PSAnsiFileMap  # shows ANSI mappings

###### pure string output
    ls *.pdf | select -expand name
    ls $path | select -expand FullName

##### get-content
    gc <file>
    gc somefile.txt | where { $_ -match “expression”}

aliases: `cat`, `type`

##### lastwritetime
    lwp \.ps1
    lwt md md
    lwt sh sh
    lwt docs doc odt
    lwt tex cls sty tex
    lwt txt txt

###### quick terminal output
    lwts *.ps1 *.sh
    lwts *.txt

##### sizes
    du64 -l 1
    Get-GitSize  # when you're in .git's parent directory

###### functions in $MSWin10\PSProfile.ps1
    dc
    fso
    gfsi

##### symlinks
    csl  # targets in green or red
    ls -force -s | ?{$_.linktype} # recursively list symlinks
    ls . -force  # Gets both hidden & non-hidden. Shows desired symlinks target.

#### manipulations
    ((gc $WF) -join "`n") + "`n" | seco -NoNewline $WF  # CRLF -> LF
    ls -s -i "*.txt" | %{mi $_.fullname ($_.fullname -replace ".txt",'.dw')}  # renames all txt's to dw's
    remove-itemsafely file_or_dir  # to Recycle Bin
    robocopy /mir <sourcedir> <destinationdir> /l  # runs a simulation of mirroring source to destination
    takeown /? | less

- `move-item`: `move`, `mv`, `mi`
- `z -?` (`ZLocation`)

##### remove-item
- `del`, `erase`, `rd`, `ri`, `rm`, `rmdir`
- `--recurse`

##### aliases
`copy-item`: `copy` `cp` `cpi`
`rename-item`: `ren`, `rni`

##### new-item
    ni <directory> -type directory

`md` = `mkdir`, which calls `new-item`

### foreach-object
- `%` = `foreach`
- not the `foreach` loop statement

### help
    get-help Start-BitsTransfer
    man <cmdlet>  # Get-Help, paged
    powershell /?
    Update-Help -UICulture en-US

`F1` dynamic help (= `PSReadLine ShowCommandHelp` on command closest to left of cursor)

### history
    Get-LastModifiedFile

#### command history
    gvim (Get-PSReadlineOption).HistorySavePath
    h  # Get-History

### microsoft.powershell.core
    <command> | out-null  # works for some commands
    (gcm <function>).scriptblock  # (get-command) shows what's in <function>

- `?` (= `where` = `where-object`)

### microsoft.powershell.management
- `gc` (= `cat` = `type` = `get-content`)
- `gp` (= `get-itemproperty`)
- `gpv` (= `get-itempropertyvalue`)
- `saps` (= `start` = `start-process`)
- `sp` (= `set-itemproperty`)

#### get-process
    ps | oh -paging
    ps | ?{$_.mainwindowtitle} | ft id, name, mainwindowtitle -autosize

### microsoft.powershell.psresourceget
    get-installedPSResource
    get-PSResourceRepository

### microsoft.powershell.utility
- `fl` (= `format-list`)
- `measure` (= `measure-object`)
- `select` (= `select-object`)
- `sls` (= `select-string`)
- `sort` (= `sort-object`)

#### invoke-expression
    iex <someCommand>

prefer `&` where possible

### networking
    wp

#### IP
    cc
    get-whois 8.8.8.8
    ip

### package manage
    get-package | format-table -autosize

#### modules
    gvim $HADL\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
    New-BurntToastNotification
    pc  # PowerColorLS

- `inmo` (`install-module`)
- `ipmo` (`import-module`)
- `rmo` (`remove-module`)

##### get-module
    gmo -all
    gmo -listavailable  # details, including old and those in  Windows PowerShell

##### help
    *.help.txt
    update-help -uiculture en-us
    ~\Documents\PowerShell\Help\en-US\about_Regular_Expressions.help.txt

##### paths
    $env:psmodulepath -split (';')
    $pshome/Modules
    ~\Documents\PowerShell\Modules

##### powershellget
    get-installedmodule
    get-psrepository

##### update
    $machBld\updateModules.ps1  # for reference
    compare-module | where updateneeded | foreach { update-module $_.name }  # slow but reliable

### PSScriptTools
    Get-MyAlias  # limited to  PSScriptTools
    Get-DirectoryInfo  # alias  dw
    Get-MyVariable
    Get-PathVariable
    get-powershellengine -detail
    Get-PSSessionInfo
    Get-PSScriptTools  # synopsi of commands
    Get-TZData Europe/Paris
    Get-WhoIs 8.8.8.8
    Open-PSScriptToolsHelp

#### colours
    Get-PSSessionInfo

##### bars
    New-ANSIBar -Range (232..255)
    New-RedGreenGradient

#### compact lists
    Get-ModuleCommand ps.checkModuleUpdates
    Get-ModuleCommand PSScriptTools

#### Show-Tree
    pstree -?
    t [n]  => pstree <depth>

`-InColor` only works in `Windows PowerShell`

### PSFzf
    Alt+a   # select an argument
    Alt+c   # change to sub-directory
    Ctrl+r  # search PSReadline History
    Ctrl+t  # select provider path
    Invoke-Fzf -?

tab completion

### Ruby
    where.exe irb
    where.exe ruby

### scripts
    $funs = gc "$MSWin10\PSProfile.ps1" | sls -pattern "function\s+([^\s{]+)" | %{ $_.matches.groups[1].value }; $funs -join '  '  # lists function names
    'a','b','c'|%{if($_ -eq 'b'){continue}else{$_}}
    . <script_to_dot_source>
    Get-InstalledScript
    get-verb | sort -property verb
    param( [switch]$doSomething )  # -doSomething  creates  $doSomething = true
    return
    ~\Documents\PowerShell\Scripts

#### functions
    $function:<function>  # contains it's internal commands
    function global:<function> { ... }
    function args { $a0 = $args[0]; $a1 = $args[1]; "$a0 $a1" }; args here there

#### if statement
    if (c1) {a1} elseif (c2) {a2} else (c3) {a3}
    if ( $n -gt 13 -and $n -lt 55 )
    if ( 5 -eq $n )

### stray cmdlets
    get-commandsyntax <command>

- `format-table`: `ft`
- `get-item`: `gi`

### system info
    $profile
    (gcim win32_operatingsystem) | select -property version, caption
    (gcm prompt).ScriptBlock
    get-pslocation
    get-pswho
    get-windowsupdatelog  # creates  $HOME\Desktop\WindowsUpdate.log
    sysdm.cpl  # pops up  System Properties
    winver  # pops up  About Windows
    get-pssessioninfo
    test-iselevated

#### environment variables
    $env:computername
    $env:localappdata
    $env:pathext
    $env:programfiles  # C:\Program Files
    ${env:programfiles(x86)}  # C:\Program Files (x86)
    $env:username
    $env:userprofile
    $home
    $psscriptroot
    ls env:  # list the environment variables

##### Roaming
    $Env:AppData  # C:\Users\...\AppData\Roaming
    ls "$Env:AppData\Pandoc\defaults"

##### path
    (gp 'registry::hkcu\environment' path).path -split ';'
    Get-PathVariable

#### registry
    $oldPathCU = (gp -path ‘registry::hkcu\environment’ -name path).path; $oldPathCU -split ';'
    $oldPathLM = (gp -path ‘registry::hklm\system\currentcontrolset\control\session manager\environment’ -name path).path; $oldPathLM -split ';'

### text wrangling
    'boob' -replace 'b$', ''
    "Hello".replace('l','x')
    (gc $file) -replace $regex, $newtext | seco $file

#### Vim
    C:\Vim\vim91\vim.exe --version
    g $HOME\.vimswap

### version
    $psversiontable.psversion
    gpv -path "hklm:\software\microsoft\powershellcore\installedversions\*" -name "semanticversion"

## Strawberry Perl
    C:\Strawberry\perl\bin\perl.exe -v
    g $home\.cpanm

## Windows Package Manager
    g C:\users\jharr\AppData\local\microsoft\winget\packages
    winget --info
    winget add SumatraPDF -h -l C:\SumatraPDF # install (--location, --silent)
    winget find powershell
    winget update --all
    winget update google.chrome
    winget rm google.chrome  # uninstall

## Windows PowerShell - file formats
    PowerShell command | out-file <file> -encoding utf8BOM  # detected as utf-8
    PowerShell command > <file>  # detected as latin1

## Windows PowerShell - modules
    get-installedmodule
    get-module -listavailable  # details, including old
    C:\Users\jnbh\OneDrive\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

### paths
    $Env:PSModulePath -split ';'
    ~\Documents\WindowsPowerShell\Modules

## Windows Subsystem for Linux
    \\wsl$\Ubuntu\home\jo\.bash_history
    \\wsl$\Ubuntu\usr\bin

    wsl --help
    wsl --shutdown  # kills all WSL2
    wsl -l -o
    wsl -l -v
    wsl -l --running
    wsl -v

- `sudo apt update` [the package index]
- `sudo apt upgrade`

# file manage - lf
    $HOME\AppData\Local\lf\lfrc

by gokcehan

# file manage - robocopy
    ROBOCOPY.exe

- `/E` subfolders, including empty
- `/fft` 2-second granularity (FAT File Times)
- `/l` list only (simulate)
- `/mir` `/e /purge` (mirror)
- `/tee` output to console as well as log file

# fzf
    alt+c
    fzf -h
    fzf --version

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
    pt '$machBld' .
    pt 's~~$' .

# Windows Terminal
- in Explorer: `Alt+D > wt > Enter`
- `win+;` emojis
- `win+r > wt` opens `wt` on `~`

## Settings
    Startup > Launch on machine startup

### key-binds
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

### settings.json
    cpi ~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json $machLg\WT-settings.json

default actions don't show, but when I binned annoying `alt+enter` & `<f11>` "Baculer en plein écran", they show as `unbound`

# Windows Loupe
- `ctrl+alt+flèche` bouger
- `ctrl+alt+f/l` basculer en affichage
- `win+=` activer la loupe
    - `win+=\-` zoom avant/arrière
- `win+ctrl+m` paramètres de la loupe
- `win+esc désactiver la loupe

