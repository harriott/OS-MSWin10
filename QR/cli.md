vim: nospell:

    $MSwin10\QR\cli.md

    chcp  # reports code page
    java -jar C:\LanguageTool\languagetool-commandline.jar -h
    ~\AppData\Roaming\Vifm\vifmrc

`intl.cpl` (= Panneau de configuration > Région)

# console code page
    chcp [65001]
    REG query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont"

# Command Prompt
    dir * /x

- in Explorer: `Alt+D > cmd > Enter`
- `PS> cmd` then `exit`

## environment variables
    echo %LOCALAPPDATA%  # C:\Users\<user>\AppData\Local
    echo %username%
    echo %userprofile%
        echo %appdata%
        echo %localappdata%
    set  # shows them all

### computer name
    echo %computername%
    hostname

### path
    echo %path:;=&echo.%  # %PATH% on separate lines
    powershell -Command ($env:Path).split(';')
    pwsh -Command ($env:Path).split(';')

# fzf
    alt+c
    fzf -h
    fzf --version

# MiKTeX
    miktex fndb refresh
    ~\AppData\Local\MiKTeX\miktex\log\initexmf.log
    ~\AppData\Local\MiKTeX\miktex\log\miktex-makemf.log
    ~\AppData\Local\Programs\MiKTeX\miktex\config\xelatex.ini

# The Platinum Searcher
    pt /version
    pt text_to_find .

## in $Drpbx\JH
    pt '$core' .
    pt '$DJH' .
    pt '$JH' .
    pt 'notmatch' .

### `$core`
    pt '$machBld' .
    pt 's~~$' .

# PowerShell
    $function:<function>  # contains it's internal commands
    $myinvocation.mycommand.name  # = the script's name
    $MSwin10\gac.ps1  # to explore all commands
    '"Hello world"'
    1..3
    less <someFile>
    foreach($element in 1..3){ $element }
    sleep 1

- `Alt > Space > E > L > up/down` to scroll, then `Esc`
- `$_` = `$PSItem` = current object in the pipeline object

## alias manage
limited to single commands

### ?-Alias
    gal -Definition Get-ChildItem
    gal h*
    gal ls
    gal | sort Source | ft -view Source
    nal <alias> <string>
    sal <alias> <string>

## colour
    [System.Enum]::GetValues('ConsoleColor') | %{ Write-Host $_ -ForegroundColor $_ }
    iex "$ITstack\MSWin\PowerShell\colours\ConsoleColor.ps1"
    iex "$ITstack\MSWin\PowerShell\colours\LindbergColors.ps1"
    iex "$onGH\misc\Colors.ps1"
    write-color -text 'red ', 'green ', 'yellow ' -color red,green,yellow  # pswritecolor

## data
    $x.GetType()

### arrays
    $a = 1,'a',2,'b'
    foreach ($element in $myArray) {$element}
    Format-Custom -InputObject $array -Expand CoreOnly  # displays structure

### strings
    "Hello".Replace('l', 'x').Replace('H', 'Y')
    'a'.equals('b')
    'me'+'et'
    $string.trim()  # removes whitespaces (including newlines) from ends
    [string]$Pwd
    format-string powershell -randomize
    if ( '5' -ne '4' ) { '5 is not 4' }

## datetime
    [system.timezoneinfo]::getsystemtimezones() | out-gridview
    get-timezone -listavailable | out-gridview
    Get-TZData Australia/Hobart

### get-date
    $n = get-date -f yyyyMMddhhmmss
    (get-date).day  # of month
    (get-date).tostring("yyMMdd-HHmmss")

no standard aliases

## executables
    cd 'C:\Program Files'
    (gp hklm:\software\microsoft\windows\currentversion\uninstall\* ).displayname | sort  # lists removable x64 programs
    C:\MozillaThunderbird\thunderbird.exe -addressbook
    C:\Windows\explorer.exe "microsoft-edge:searchterm"
    gcm explorer
    explorer shell:Appsfolder  # Applications
    powershell -noprofile  #  runs  Windows PowerShell
    pwsh -nol
    start <somefile>

### where.exe
    where.exe gpg
    where.exe pwsh
    where.exe sumatrapdf
    where.exe where.exe

doesn't find executables in `~\AppData\`

## file contents
    (gc $file | select -skip 3) | seco $file  # removes first 3 lines
    (gc $file_with_whitespaces_at_ends_of_lines).trim() | seco trimmed.txt

## foreach-object
- `%` = `foreach`
- not the `foreach` loop statement

## help
    get-help Start-BitsTransfer
    man <cmdlet>  # Get-Help, paged
    powershell /?
    Update-Help -UICulture en-US

`F1` dynamic help (= `PSReadLine ShowCommandHelp` on command closest to left of cursor)

## history
    Get-LastModifiedFile

### command history
    gvim (Get-PSReadlineOption).HistorySavePath
    h  # Get-History

## microsoft.powershell.core
    <command> | out-null  # works for some commands

### get-command
    (gcm <function>).scriptblock  # shows what's in <function>

## microsoft.powershell.management
- `gc` (= `cat` = `type` = `get-content`)
- `gp` (= `get-itemproperty`)
- `gpv` (= `get-itempropertyvalue`)
- `sp` (= `set-itemproperty`)

### get-process
    ps | oh -paging
    ps | ?{$_.mainwindowtitle} | ft id, name, mainwindowtitle -autosize

## microsoft.powershell.psresourceget
    get-installedpsresource
    get-psresourcerepository

## microsoft.powershell.utility
    iex <someCommand>  # = invoke-expression

- `fl` (= `format-list`)
- `measure` (= `measure-object`)
- `select` (= `select-object`)
- `sls` (= `select-string`)
- `sort` (= `sort-object`)

## networking
    wp

### IP
    cc
    ip
    Get-WhoIs 8.8.8.8

## package manage
    get-package | format-table -autosize

### modules
    get-module
    get-module -all
    get-module -listavailable  # details, including old and those in  Windows PowerShell
    gvim $env:localappdata\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
    New-BurntToastNotification
    pc  # PowerColorLS

#### help
    *.help.txt
    update-help -uiculture en-us
    ~\Documents\PowerShell\Help\en-US\about_Regular_Expressions.help.txt

#### paths
    $env:psmodulepath -split (';')
    $pshome/Modules
    ~\Documents\PowerShell\Modules

#### powershellget
    get-installedmodule
    get-psrepository

#### update
    $machBld\updateModules.ps1  # for reference
    compare-module | where updateneeded | foreach { update-module $_.name }  # slow but reliable

## PSScriptTools
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

### colours
    Get-PSSessionInfo

#### bars
    New-ANSIBar -Range (232..255)
    New-RedGreenGradient

### compact lists
    Get-ModuleCommand ps.checkModuleUpdates
    Get-ModuleCommand PSScriptTools

### Show-Tree
    pstree -?
    t [n]  => pstree <depth>

`-InColor` only works in `Windows PowerShell`

## PSFzf
    Alt+a   # select an argument
    Alt+c   # change to sub-directory
    Ctrl+r  # search PSReadline History
    Ctrl+t  # select provider path
    Invoke-Fzf -?

tab completion

## Ruby
    where.exe irb
    where.exe ruby

## scripts
    $funs = gc "$MSWin10\PSProfile.ps1" | ss -pattern "function\s+([^\s{]+)" | %{ $_.matches.groups[1].value }; $funs -join '  '  # lists function names
    Get-InstalledScript
    param( [switch]$doSomething )  # -doSomething  creates  $doSomething = true
    ~\Documents\PowerShell\Scripts

## storage
    get-volume  # reports partitions
    ii .  # invoke Explorer on WD
    sl ~ (= set-location C:\Users\$ENV:UserName")
    takeown /? | less

### investigations
    bat <textFile>  # with beautiful formatting and less paging
    dw -?
    dw  # directory counts
    f  # fzf preview files with bat
    Get-FileHash <fileForWhichYouWantSHA256>
    gl  # pwd = get-location
    if ( ! ( test-path 'dir' ) ) { ni -name 'dir' -type directory }
    pc -a -l -t  # includes hidden & time sorted
    stringInVims "string"

#### symlinks
    csl  # targets in green or red
    gci -force | ?{$_.linktype}

#### by extension
    cex
    Get-FileExtensionInfo -r
    tomalak

#### gci
    dir, list, ls
    gci * | select FullName
    gci * | select Name
    gci . -force  # Gets both hidden & non-hidden. Shows desired symlinks target.
    gci -r -i i1*,i2*,i3*
    gci -r -i '* (* conflicted copy *' |%{echo $_.fullname} | ri
    gci -r | ? Name -match <regex>

##### PSAnsiMap
    gci . | ft -view ansi  # overrides Terminal-Icons
    Get-PSAnsiFileMap  # shows ANSI mappings

##### pure string output
    gci *.pdf | select -expand name
    gci $path | select -expand FullName

#### get-content
    gc <file>
    gc somefile.txt | where { $_ -match “expression”}

aliases: `cat`, `type`

#### lastwritetime
    lwp \.ps1
    lwt md md
    lwt sh sh
    lwt docs doc odt
    lwt tex cls sty tex
    lwt txt txt

##### quick terminal output
    lwts *.ps1 *.sh
    lwts *.txt

#### sizes
    du64 -l 1
    Get-GitSize  # when you're in .git's parent directory

##### functions in $MSWin10\PSProfile.ps1
    dc
    fso
    gfsi

### manipulations
    gci -r -i "*.txt" | %{mi $_.fullname ($_.fullname -replace ".txt",'.dw')}  # renames all txt's to dw's
    robocopy /mir <sourcedir> <destinationdir> /l  # runs a simulation of mirroring source to destination

- `remove-item`: `del`, `erase`, `rd`, `ri`, `rm`, `rmdir`
- `ROBOCOPY.exe`

#### aliases
`copy-item`: `copy` `cp` `cpi`
`move-item`: `move`, `mv`, `mi`
`remove-item`: `erase`, `del`, `rd`, `ri`, `rm`, `rmdir`
`rename-item`: `ren`, `rni`

#### new-item
    ni <directory> -type directory

`md` = `mkdir`, which calls `new-item`

## stray cmdlets
    get-commandsyntax <command>

- `format-table`: `ft`
- `get-item`: `gi`

## system info
    $profile
    (gcim win32_operatingsystem) | select -property version, caption
    get-pslocation
    get-pswho
    get-windowsupdatelog  # creates  $HOME\Desktop\WindowsUpdate.log
    sysdm.cpl  # pops up  System Properties
    winver  # pops up  About Windows
    get-pssessioninfo
    test-iselevated

### environment variables
    $env:computername
    $env:localappdata
    $env:pathext
    $env:programfiles  # C:\Program Files
    ${env:programfiles(x86)}  # C:\Program Files (x86)
    $env:username
    $env:userprofile
    $home
    $psscriptroot
    gci env:  # list the environment variables

#### Roaming
    $Env:AppData  # C:\Users\...\AppData\Roaming
    ls "$Env:AppData\Pandoc\defaults"

#### path
    $env:Path -split ';'
    Get-PathVariable

### registry
    $oldPathCU = (gp -path ‘registry::hkcu\environment’ -name path).path; $oldPathCU -split ';'
    $oldPathLM = (gp -path ‘registry::hklm\system\currentcontrolset\control\session manager\environment’ -name path).path; $oldPathLM -split ';'

## text wrangling
    'boob' -replace 'b$', ''
    "Hello".Replace('l', 'x')
    (gc $file) -replace $regex, $newtext | seco $file

## version
    $psversiontable.psversion
    gpv -path "hklm:\software\microsoft\powershellcore\installedversions\*" -name "semanticversion"

# robocopy
    /l   - list only (= simulate)
    /tee - output to console as well as log file

# Windows Package Manager
    winget --info
    winget add altsnap  # install
    winget find powershell
    winget update --all
    winget update google.chrome
    winget rm google.chrome

# Windows PowerShell - modules
    get-installedmodule
    get-module -listavailable  # details, including old

## paths
    $Env:PSModulePath -split ';'
    ~\Documents\WindowsPowerShell\Modules

# wt
    cpi ~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json $machLg\WT-settings.json

- in Explorer: `Alt+D > wt > Enter`
- <https://www.microsoft.com/en-gb/p/windows-terminal-preview/9n0dx20hk701>
- `win+;` emojis
- `win+r > wt` opens `wt` on `~`
- Windows Terminal

## Settings
    Startup > Launch on machine startup

- `alt+shift+-` = `split down`
- `Ctrl+,` = `Settings`

### key-binds
    Settings > Actions

- `Alt+D` duplicate pane right
- `Alt+_` split pane below (AZERTY `Alt+Shift+-`)
- `Alt++` split pane right
- `Alt+arrow` move focus
- `Ctrl+c` copy text
- `Ctrl+Shift+f` find
- `Ctrl+Shift+t` new tab
- `Ctrl+Shift+w` close pane
- `Ctrl+Shift+PgUp` scroll up a page
- `Ctrl(+Shift)+Tab` move to next (previous) tab

