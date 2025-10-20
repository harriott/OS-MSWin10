vim: nospell:

    $MSWin10/QR/CLI/encoding-PowerShell.md

    $coreIT\MSWin\PowerShell\Scratch.ps1
    $myinvocation.mycommand.name  # = the script's name
    $MSWin10\gac.ps1  # to explore all commands
    1..3
    fd -tf -u index.lock | %{ri $_}
    get-volume  # reports partitions
    foreach($element in 1..3){ $element }
    sleep 1

- `$_` = `$PSItem` = current object in the pipeline object
- `Alt > Space > E > L > up/down` to scroll, then `Esc`
- `continue` returns to the top of a loop a `trap` or a `switch`
- `gi` (= `Get-Item`)
- redirection operators: `>`, `>>`, `2>`, `2>>`, `2>&1`

# alias manage
limited to single commands

## ?-Alias
    gal -Definition Get-ChildItem
    gal h*
    gal | sort Source | ft -view Source
    nal <alias> <string>
    sal <alias> <string>

# data
    $x.GetType()
    sv var $true; $var

- `gu` (= `Get-Unique`)
- objects

## arrays
    $a = '1 a 2 b'
        $a.Split(" ")
        (-split $a)
    $a = 1,'a',2,'b'; $a[1]; $a[-1]; $a.length
    $a = @(); $a += 'first'; $a += 'second'
    $a = gc <file_to_grab_as_array>
    $array | sort
    foreach ($element in $myArray) {$element}
    Format-Custom -InputObject $array -Expand CoreOnly  # displays structure

## numbers
    $n=9; '{0:d4}' -f $n  # padded to 4 digits
    1..30 | %{($_*3).ToString('000')} # multiples of 3 padded

## strings
    $string.length
    'a'.equals('b')
    'me'+'et'
    [string]$pwd
    if ( !$y ) { 'no' }
    format-string powershell -randomize
    if ( 'n' -eq 'n' ) { 'equal' }
    if ( '5' -ne '4' ) { '5 is not 4' }
    if ( 'b' -gt 'a' ) { 'b gt a' }

### make changes
    $b='o'; $b=$b+'o'; $b
    $string.trim()  # removes whitespaces (including newlines) from ends
    'boob' -replace 'b$', ''
    "Hello".Replace('l', 'x').Replace('H', 'Y')

### match
    'IF' -match '^t$|^f$'
    if ( ! ( 'a' -match 'b' ) ) { 'a not b' }

### regex
    'hi.there.jpg' -replace 'g', ''             # hi.there.jp
    'hi.there.jpg' -replace 'e.*', ''           # hi.th
    'hi.there.jpg' -replace 'e.*$', ''          # hi.th
    'hi.there.jpg' -replace 'e.+?$', ''         # hi.th
    'hi.there.jpg' -replace 'e.*?$', ''         # hi.th
    'hi.there.jpg' -replace 'e([^.]*)', ''      # hi.th.jpg
    'hi.there.jpg' -replace '\.([^.]*)', ''     # hi
    'hi.there.jpg' -replace 't([^.]*)', ''      # hi..jpg
    'hi.there.jpg' -replace '\.([^.]*)$', ''    # hi.there
    'hi:there:jpg' -replace '^.*:', ''       # jpg
    'hi:there:jpg' -replace '(.*?):(.*)', '$2'  # there:jpg

`\n` = newline
`\s` = whitespace character
`\S` = non-whitespace character
`\w` = a-z, A-Z, 0-9, _

### substring method
    $s='stringROD'; $s.substring(0, $s.length -3)
    'abcdefg'.substring(2,3)  # 3 characters starting from index 2 (= 3rd character)
    'abcdefg'.substring(3)  # starting from index 3

# datetime
    [system.timezoneinfo]::getsystemtimezones() | out-gridview
    get-timezone -listavailable | out-gridview
    Get-TZData Australia/Hobart

## get-date
    $n = get-date -f yyyyMMddhhmmss
    (get-date).day  # of month
    (get-date).tostring("yyMMdd-HHmmss") # hh would show 12h cycle

no standard aliases

### PSCalendar
    Get-Calendar -Month Octobre -Year 2012 -HighlightDate 27/10/2012
    Get-Calendar -Start 1/7/24 -End 3/11/2024

# drives
    gdr

## registry
    (gp -path ‘registry::hklm\system\currentcontrolset\control\session manager\environment’ -name path).path; $oldPathLM -split ';'
    (gp -path ‘registry::hkcu\environment’ -name path).path; $oldPathCU -split ';'
    gdr -PSProvider Registry | select -Property Name, Root
    ls HKCU:Printers -Recurse -Depth 1

# executables
    (gcm python | select version | ft -HideTableHeaders | out-string).trim()
    (gp hklm:\software\microsoft\windows\currentversion\uninstall\* ).displayname | sort  # lists removable x64 programs
    cd 'C:\Program Files'
    C:\Windows\explorer.exe "microsoft-edge:searchterm"
    explorer shell:Appsfolder  # Applications
    g $HADLM\WinGet\Packages
    get-commandsyntax <command>
    get-startapps  # lists AppIDs
    start <somefile>

## *-Process
    kill -name HP.Smart

### Get-Process
    ps AltSnap
    ps Dropbox
    ps HP.Smart
    ps msedge | select PM,WS | ft @{Label='PM (MB)';Expression={$_.PM / 1MB}},@{Label='WS (MB)';Expression={$_.WS / 1MB}} # pageable memory, working set
    ps | oh -paging
    ps | ?{$_.mainwindowtitle} | ft id, name, mainwindowtitle -autosize

#### all
    $procs = ps * | select -expand ProcessName; $pAr = -split $procs
        $pAr | gu  # vertical list
        ([string]($pAr | gu)).replace(' ','  ')  # all on one line
    ps <ProcessName> | select PM,WS  # Private Memory, Working Set

## Bash
    & C:\Git\bin\bash.exe --version
    & C:\Git\usr\bin\bash.exe --version
    & C:\Users\jharr\AppData\Local\Microsoft\WindowsApps\bash.exe --version
    & C:\Windows\System32\bash.exe --version
    bash --version
    where.exe bash

## FFmpeg
    ffmpeg -version > $MSWml\ffmpeg_version
    where.exe ffmpeg

## get-command
    gcm explorer
    gcm lsd
    gcm python | fl *

## ImageMagick
    where.exe magick

### biz card backgrounds
    magick -size 924x568 plasma: plasma1.jpg
    magick -size 924x568 xc:'rgba(0, 0, 0)' black.jpg

### recursive conversions
    gci -r *.jpg | %{ magick $_ -resize 900 $_ }

#### tiff -> jpg
    gci -r *.tiff | %{ magick $_ $_'.jpg' }
    gci -r *.tiff | rm

## Microsoft Visual Studio parts
    & "$CPFx\Microsoft Visual Studio\Installer\vswhere.exe" -?
    Get-VSSetupInstance  # reports  Visual Studio Build Tools 2022  version

otherwise little sign of them

## Perl
    perl -e 'print \"Hello World\"'
    perl -e "print qq(Hello, world!)"
    perl -i -ne 'printf q(%04d %s), $., $_' <file_needing_linenumbers>
    perl -ne 'printf' <file_to_print>

`Strawberry Perl`: `$env:TERM="dumb"; cpan`

## PowerShell
    $programfiles\PowerShell\7\powershell.config.json
    pwsh -? | less
    pwsh -nol  # -NoLogo
    pwsh -nop  # -NoProfile
    saps pwsh -verb runas  # Administrator

## Scoop
    g $home/scoop
    scoop help
    scoop update

## Thunderbird
    C:\MozillaThunderbird\thunderbird.exe -addressbook
    ps thunderbird
    where.exe thunderbird

## Windows PowerShell
    powershell -noprofile  #  runs  Windows PowerShell
    saps powershell -verb runas  # Administrator

## where.exe
    where.exe gpg
    where.exe pwsh
    where.exe python
    where.exe rg
    where.exe sumatrapdf
    where.exe where.exe
    where.exe zig

doesn't find executables in `~\AppData\`

# file contents
    less <someFile>

`seco` (= `Set-Content`) `$MSWin10\PSProfile.ps1`

## Get-Content
    (gc $file | select -skip 3) | seco $file  # removes first 3 lines
    (gc $file_with_whitespaces_at_ends_of_lines).trim() | seco trimmed.txt
    gc somefile.txt | where { $_ -match “expression”}

aliases: `cat`, `type`

### those using CRLF
    fd -tf | ?{(gc $_ -raw) -match '\r\n'} | %{((gc $_) -join "`n") + "`n" | seco -NoNewline $_} # CRLF -> LF
    fd -tf -uu | ?{(gc $_ -raw) -match '\r\n'}

## replace
    (gc $file) -replace $regex, $newtext | seco $file

replace text in files

# file manage
    fd -utd '\.git$' | %{ rg 'url = ' $_\config }
    ii .  # invoke Explorer on WD
    lsd --help
    mv file dir/file -force
    sl ~ (= set-location C:\Users\$ENV:UserName")

## investigations
    bat <textFile>  # with beautiful formatting and less paging
    dw -?
    dw  # directory counts
    f  # fzf preview files with bat
    get-filehash <fileForWhichYouWantSHA256>
    gl  # pwd = get-location
    if ( ! ( test-path 'dir' ) ) { ni -name 'dir' -type directory }
    pc -a -l -t  # includes hidden & time sorted
    stringInVims "string"

### by extension
    cex
    Get-FileExtensionInfo -r
    tomalak

### gci
    (ls -Force -s).count  # includes hidden/system files
    (ls -s).count
    gal dir
    gal ls
    ls * | select FullName
    ls * | select Name

- `-ad` = `-Directory`
- `-af` = `-File`
- `-h` = `-Hidden` only
- `-Force` = include hidden & system files

#### recurse
- `-s` = `-Recurse`
    - `-e <leaf_glob>` (invokes `-exclude`)

##### -notmatch
    (gci -s).fullname -notmatch 'git\\'
    gci -s -e *.eml | ? { $_.fullname -notmatch '.git\\' } | select FullName

takes a regex

#### list of names
    ls -name
    (ls).fullname
    (ls).name

#### PSAnsiMap
    ls . | ft -view ansi  # overrides Terminal-Icons
    Get-PSAnsiFileMap  # shows ANSI mappings

#### pure string output
    ls *.pdf | select -expand name
    ls $path | select -expand FullName

#### recursive lists
    ls -file -s
    ls -directory -s
    ls -s -depth 1  # including contents of subdirectories
    ls -s -i i1*,i2*,i3*  # -include
    ls -s -i '* (* conflicted copy *' |%{echo $_.fullname} | ri
    ls -s | ? Name -match <regex>

### lastwritetime
    ls -file -s | %{ dtsfn $_ ':' } | sort  # all files recursively
    lwp \.ps1
    lwt lua lua
    lwt md md
    lwt ps1 ps1
    lwt sh sh
    lwt docs doc docx odt
    lwt tex cls sty tex
    lwt txt txt

### sizes
    du64 -l 0 -nobanner
    Get-GitSize  # when you're in .git's parent directory

#### functions in $MSn\PS\Profile.ps1
    dc  # all: mb
    fso  # mb FullName
    gfsi

### symlinks
    csl  # targets in green or red
    ls -force -s | ?{$_.linktype} # recursively list symlinks
    ls . -force  # Gets both hidden & non-hidden. Shows desired symlinks target.

## lf
    $HADL\lf\lfrc
    g $home

by gokcehan

## manipulations
    ls -s -i "*.txt" | %{mi $_.fullname ($_.fullname -replace ".txt",'.dw')}  # renames all txt's to dw's
    robocopy /mir <sourcedir> <destinationdir> /l  # runs a simulation of mirroring source to destination
    takeown /? | less

`z -?` (`ZLocation`)

### -item
- `move-item`: `move`, `mv`, `mi`
- `rename-item`: `ren`, `rni`

#### copy-item
- `-recurse`
- `copy` `cp` `cpi`

#### new-item
    ni <directory> -type directory

`md` = `mkdir`, which calls `new-item`

#### remove-item
    remove-itemsafely file_or_dir  # to Recycle Bin

##### remove-item
- `-recurse`
- `del`, `erase`, `rd`, `ri`, `rm`, `rmdir`
- no easy way to remove a folder, and not sent to Recycle...

# ForEach-Object
- `%` = `foreach`
- not the `foreach` loop statement

# Ghostscript
    gsp  # ($MSn/PS/Profile.ps1) Ghostscript convert pdf to png
    gswin64c -h

# help
    get-help Start-BitsTransfer
    man <cmdlet>  # Get-Help, paged
    powershell /?
    Update-Help -UICulture en-US

`F1` dynamic help (= `PSReadLine ShowCommandHelp` on command closest to left of cursor)

# history
    Get-LastModifiedFile

## command history
    gvim (Get-PSReadlineOption).HistorySavePath
    h  # Get-History

# microsoft.powershell.core
    <command> | out-null  # works for some commands

`?` (= `where` = `Where-Object`)

# microsoft.powershell.management
- `gc` (= `cat` = `type` = `get-content`)
- `gp` (= `Get-ItemProperty`)
- `gpv` (= `get-itempropertyvalue`)
- `saps` (= `start` = `start-process`)
- `sp` (= `set-itemproperty`)

# microsoft.powershell.utility
    $pw = Read-Host "Password?" -MaskInput

- `echo` (= `write` = `Write-Output`)
- `fl` (= `format-list`)
- `measure` (= `measure-object`)
- `select` (= `Select-Object`)
- `sls` (= `select-string`)
- `sort` (= `Sort-Object`) `-Unique`

## invoke-expression
    iex <someCommand>

prefer `&` where possible

# networking
    Get-NetAdapter  # returns MacAddress
    wp

`iwr` (= `Invoke-WebRequest`)

## IP
    get-whois 8.8.8.8
    ip  # external address

### internal
    (Get-NetIPConfiguration | ? { $_.IPv4DefaultGateway -ne $null }).IPv4Address.IPAddress
    lanip  # $MSn\PS\Profile.ps1

# output
    Out-File

`ft` (= `Format-Table`)

## colour
    & "$coreIT\MSWin\PowerShell\colours\ConsoleColor.ps1"
    & "$coreIT\MSWin\PowerShell\colours\LindbergColors.ps1"
    & "$onGH\misc\Colors.ps1"
    write-color -text 'red ', 'green ', 'yellow ' -color red,green,yellow  # PSWriteColor
    [enum]::getvalues([type]'system.consolecolor').ForEach{@{$_ = $_.value__}}
    [System.Enum]::GetValues('ConsoleColor') | %{ write-host $_ -ForegroundColor $_ }

### Pansies
    Get-Gradient red blue -Flatten | %{Write-HostGGrb " " -BackgroundColor $_ -NoNewline}
    "I ${fg:red}LOVE${fg:clear} PS"

`Write-Host` is upgraded with colour functionality

### $PSStyle
    write-host "$($PSStyle.foreground.magenta)$($PSStyle.background.white)magenta_on_white$($PSStyle.reset)"  # no bleeding!

#### view colours
    $PSStyle.Background
    $PSStyle.Foreground

## quotes
    '"Hello world"'
    'rg''ing'

# package manage
    get-package | format-table -autosize
    schtasks /query /tn "AltSnap onlogon"

## Microsoft.PowerShell.PSResourceGet
    Get-PSResourceRepository

- `Get-PSResource` (= `Get-InstalledPSResource`)
    - doesn't find modules in `$env:programfiles\WindowsPowerShell\Modules`
- `isres` (= `Install-PSResource`)
    - installs to
        - `$HOME\Documents\PowerShell\Modules`
        - `$HOME\Documents\WindowsPowerShell\Modules`
    - might need to reload `Windows Powershell`

## modules
    $HADR/Microsoft/Windows/PowerShell/PSReadLine/ConsoleHost_history.txt
    $MSWin10/build/PSmodules.ps1
    p  # PowerColorLS (`$MSWin10\PSProfile.ps1`)
    toast  # New-BurntToastNotification

- `ipmo` (`import-module`)
- `inmo` (`install-module`, of deprecated `PowerShellGet`)
    - installs to `$HOME\Documents\PowerShell\Modules`
- `rmo` (`remove-module`)

### get-module
    gmo -all
    gmo -listavailable  # details, including old and those in  Windows PowerShell
    gmo BurntToast

### help
    *.help.txt
    update-help -uiculture en-us
    ~\Documents\PowerShell\Help\en-US\about_Regular_Expressions.help.txt

### paths
    $env:psmodulepath -split (';')

#### PowerShell
    $HOME\Documents\PowerShell\Modules  # and Delete outdated
    $PSHOME\Modules  # where pre-installeds live

#### Windows PowerShell
    $HOME\Documents\WindowsPowerShell\Modules  # can Delete outdated
    $env:programfiles\WindowsPowerShell\Modules

### powershellget
    Get-InstalledModule
    Get-PSRepository

### update
    cmu  # (Check-ModuleUpdates) throws some errors, lists, then provides an update command at end
    compare-module | where updateneeded | foreach { update-module $_.name }  # slow, and only for  inmo

# PS
    $PSHOME
    Get-PSReadlineOption

## PSFzf
    Alt+a   # select an argument
    Alt+c   # change to sub-directory
    Ctrl+r  # search PSReadline History
    Ctrl+t  # select provider path
    Get-PSResource PSFzf
    Invoke-Fzf -?

tab completion

## version
    $psversiontable.psversion
    gpv -path "hklm:\software\microsoft\powershellcore\installedversions\*" -name "semanticversion"

# PSScriptTools
    dw (= Get-DirectoryInfo)
    gal cc  # Copy-Command
    Get-Help Get-FolderSizeInfo -Detailed
    Get-MyAlias
    Get-MyVariable
    Get-PathVariable
    get-powershellengine -detail
    Get-PSSessionInfo
    Get-PSScriptTools  # synopsi of commands
    Get-TZData Europe/Paris
    Get-WhoIs 8.8.8.8
    Open-PSScriptToolsHelp

## colours
    Get-PSSessionInfo

### bars
    New-ANSIBar -Range (232..255)
    New-RedGreenGradient

## compact lists
    Get-ModuleCommand ps.checkModuleUpdates
    Get-ModuleCommand PSScriptTools

## Show-Tree
    pstree -?
    t [n]  => pstree <depth>

`-InColor` only works in `Windows PowerShell`

# Ruby
    g C:/Ruby32-x64/lib/ruby/gems/3.2.0/gems
    g C:/Ruby34-x64/lib/ruby/gems/3.4.0/gems
    g C:/Ruby34-x64/lib/ruby/gems/3.4.0/specifications/default
    gem list > $MSWml/gems.gems  # using  $vfv/syntax/gems.vim
    where.exe irb
    where.exe ruby

# screen brightness
    desk.cpl
    start ms-settings:display

# scripts
    $funs = gc "$MSWin10\PSProfile.ps1" | sls -pattern "function\s+([^\s{]+)" | %{ $_.matches.groups[1].value }; $funs -join '  '  # lists function names
    'a','b','c'|%{if($_ -eq 'b'){continue}else{$_}}
    . <script_to_dot_source>
    Get-InstalledScript
    get-verb | sort -property verb
    param( [switch]$doSomething )  # -doSomething  creates  $doSomething = true
    return  # about_Return
    ~\Documents\PowerShell\Scripts

## functions
    $function:<function>  # contains it's internal commands
    (gcm <function>).scriptblock  # (get-command) shows what's in <function>
    function args { "$args" }; args a b c
    function global:<function> { ... }
    function arg_exists { $a0 = $args[0]; if ($a0) {$a0} }; arg_exists
    function args { $a0 = $args[0]; $a1 = $args[1]; "$a0 $a1, and " + $args[0] + ", but $args[0]" }; args here there

### variable scopes
- `$global:var` then `$var` is usable outside the function
- `$script:var` persists for subsequent function calls

## if statement
    if (c1) {a1} elseif (c2) {a2} else {a3}
    if ( $n -gt 13 -and $n -lt 55 )
    if ( 5 -eq $n )

# stray cmdlets


# system
    $profile
    (gcim win32_operatingsystem) | select -property version, caption
    (gcm prompt).ScriptBlock
    get-pslocation
    get-pswho
    Get-WindowsUpdateLog  # creates  $HOME\Desktop\WindowsUpdate.log
    Get-WinSystemLocale
    sysdm.cpl  # pops up  System Properties
    winver  # pops up  About Windows
    get-pssessioninfo
    test-iselevated

## environment variables
    $env:computername
    $env:localappdata
    $env:pathext
    $env:programfiles  # C:\Program Files
    ${env:programfiles(x86)}  # C:\Program Files (x86)
    $env:username
    $env:userprofile ($home)
    $psscriptroot
    ls env:  # list the environment variables

### Roaming
    $Env:AppData  # C:\Users\...\AppData\Roaming
    ls "$Env:AppData\Pandoc\defaults"

### path
    (gp 'registry::hkcu\environment' path).path -split ';'
    Get-PathVariable

# Vim
    C:\Vim\vim91\vim.exe --version
    g $HOME\vimfiles
    g $HOME\.vimswap
    robocopy /mir $vimfiles D:\Play0\vf

# WSL
    (ls HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss | gp -Name DistributionName).DistributionName
    wsl --help
    wsl --shutdown  # kills all WSL2
    wsl -l -o  # (--list --online) available flavours
    wsl -l -v (--list --verbose)
    wsl -l --running
    wsl -v
    wsl df -h /

8 second rule for configuration changes

