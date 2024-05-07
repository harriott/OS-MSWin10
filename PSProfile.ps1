
# Joseph Harriott, ven 22 mars 2024

# $MSWin10\PSProfile.ps1
#  symlinked in  $MSWin10\mb\symlinks.ps1
#  called by  $MSWin10\MPSProfile.ps1

sal seco set-content  # because  sc  is overridden by  sc.exe
sal ss select-string
sal su C:\SumatraPDF\SumatraPDF.exe
. ~\Env.ps1  # ($MSwin10\mb\symlinks.ps1)

function ep {
  $eps = "$machLg/path"
  'vim: set nowrap:' > $eps
  '' >> $eps
  $env:path -split ';' >> $eps
  '' >> $eps
  '$env:path  is in  $machLg/path'
}

function fonts {
  $mf0 = "$machLg\fonts"
  $mf1 = $mf0+'-1'
  gp -path "registry::\hklm\software\microsoft\windows nt\currentversion\fonts" | fc > $mf1
  (gc $mf1 | select -skip 3) | seco $mf1
  $mf2 = $mf0+'-2'; (gc $mf1 -raw) -replace "(?s)  PSPath.*" > $mf2; ri $mf1
  $mf3 = $mf0+'.wntf'; 'vim: ft=wntf:' > $mf3; '' >> $mf3; (gc $mf2).trim() >> $mf3; ri $mf2
} # $machLg\fonts.wntf ($vimfiles/syntax/wntf.vim)

function GNFR {
  $FRlist = Get-NetFirewallRule | out-string
  $FRlf = "$machLg\FirewallRules.txt"
  "vim: set ft=NFR:" > $FRlf
  $FRlist.TrimEnd() >> $FRlf
  '' >> $FRlf
} # as administrator

function pro {
  Get-Process | sort ws -descending | select-object -first 39 ID,Name,WS,VM,PM,Handles,StartTime | ConvertTo-WPFGrid -Refresh -timeout 10 -Title "Top Processes"
} # needs to be on 3 lines

function wl {
  $dts = (Get-Date).ToString("yyMMdd-HHmmss")
  $mwgl = "$machLg/winget_list-$dts"
  $l0 = $mwgl+'0'; winget ls > $l0
  $l1 = $mwgl+'1'; (gc $l0 -raw) -replace "(?s).*------" > $l1
  ri $l0
  $lt  = "$mwgl.txt"; 'vim: set nowrap:' > $lt; '' >> $lt
  gc $l1 | sort | select -skip 2 >> $lt
  sleep 1; ri $l1
  'winget list  is in  $machLg/winget_list'+"-$dts.txt"
}

function stc {
  '"Nom de la tâche","Prochaine exécution","Statut"' > $machLg\schtasks.csv
  schtasks /fo csv /nh | sort-object | out-file -append $machlg\schtasks.csv
}
# Alternatively:
#  schtasks /fo list | out-file $machlg\schtasks.txt -encoding utf8bom
#   ri $machlg\schtasks.txt

#=> 0 convert images recursively
Function mc {
  $format1 = $args[0]
  $format2 = $args[1]
  gci -r *.$format1 | %{
    $oi = $_.Name.Replace('.', '_')
    magick $_ $oi".$format2"
    ri $_
  }
} #  mc tiff jpg

#=> 0 directories & files
function c { if ( $args[0] ) { sl $args[0] } else { sl .. }; pc }  # handily move in or out
function i { ii . }  # opens  file explorer  on current directory
Function lc { [string[]]$list = (gci).Name; $list -join '  ' }
function n { nvim $args; gc $nvim/last_directory | sl } # see $vimfiles/nvim/init.vim

sal j z  # ZLocation
sal l lsd
  function la { l -a } # --all
  function lg { l -glR } # --git stqtus
  function ll { l -l } # --long
  function lls { l -lS --reverse } # --sizesort
  function llt { l -lt --reverse } # --timesort
  function lt { l --tree }
  function ltd { l -d --tree } # -directory-only
  function lx { l -lRX } # --recursive --extensionsort
sal v vifm

# eza
function a { eza -aF --icons }  # grid, handily showing up symlinks
function e { eza --icons }
function ed { eza -DT }  # show directory tree
function er { eza -R }  # nice recursive list
function es { eza -al --icons }  # show permissions and symlinks
function et { eza -T }  # for full tree

function g {
  $env:PAGER='less'
  $env:PAGER='bat'  # i  only
  $env:SHELL='pwsh'
  lf -print-last-dir $args | sl
  } # gokcehan  lf  quits on last viewed directory

#==> changes
function chco {
    $afs = gci -recurse . | sls -pattern $args[0] | select -expand path
    foreach ($af in $afs) {
      $af; (get-content $af) -replace $args[0], $args[1] | Set-Content $af
    }
  } # (release files for: change contents)  chco '\$m' '$mmm'

function tit { ri "*.aux"; ri "*.log" }  # tidy tex = clear away TeX ancillary files

#==> investigations
ipmo PowerColorLS; sal p PowerColorLS

function csl {
  $links = gci $args[0] -force | ?{$_.linktype} | select fullname,target
  foreach ($link in $links) {
    $lfn = $link | select -expand fullname
    $lt = $link | select -expand target
    $t = 'red'
    if ( test-path $lt ) { $t = 'green' }
    write-color -text "$lfn -> ", $lt -color white, $t
    }
} #  shows good symlink targets in green, bad in red

function t {
  $d = $args[0]
  if ( $d ) { $d = "-Depth $d" }
  $pst = "pstree -InColor -ShowItem $d"
  $pst
  iex $pst
  }

#===> filetypes
function cex { gci . -r | where { ! $_.psiscontainer } | group extension -noelement | sort count -desc }

function tomalak {
# https://stackoverflow.com/questions/15064758/summarize-a-file-system-directory-with-powershell
gci -r -ea si `
  | select `
      length, `
      @{n="filetype"; e={ if ($_.psiscontainer) {""} else {$_.extension.tolower()} }}, `
      @{n="pathlength"; e={$_.fullname.length}}, `
      @{n="pathdepth"; e={$_.fullname.split("\").length - 1}} `
  | group filetype `
  | sort @{e="count"; desc=$true}, filetype `
  | select `
      name, `
      count, `
      @{n="length"; e={$_.group | measure length -sum -average} }, `
      @{n="pathlength"; e={$_.group | measure pathlength -max -average} }, `
      @{n="pathdepth"; e={$_.group | measure pathdepth -max -average} } `
  | ft `
      @{n="filetype"; e={$_.name} }, `
      count, `
      @{n="sumsizemb"; e={"{0:n1}" -f ($_.length.sum / 1mb)}; a="right"}, `
      @{n="avgsizekb"; e={"{0:n2}" -f ($_.length.average / 1mb)}; a="right"}, `
      @{n="maxpathlength"; e={[int]$_.pathlength.maximum}; a="right"}, `
      @{n="avgpathlength"; e={[int]$_.pathlength.average}; a="right"}, `
      @{n="maxpathdepth"; e={[int]$_.pathdepth.maximum}; a="right"}, `
      @{n="avgpathdepth"; e={[int]$_.pathdepth.average}; a="right"} `
      -auto
  }

#===> get file names
function gfiln { gci -r $args[0] | select -expandproperty fullname } # gfiln *u*

#====> get folder names
function gfoln { gci -r $args[0] | where { $_.psiscontainer } | select -expandproperty fullname }
# gfoln *u*

#===> lastwritetime
function dtsfn { $args[0].lastwritetime.tostring('yyyyMMdd-hh:mm:ss')+' '+$args[1]+' '+ $args[0].fullname }
# - used by other functions  gci <test> | %{ dtsfn $_ ':' }

function encrypted {
  $encrypted = "actions", "digital0", "digital1", "secure0", "secure1", "shg", "stack"
  if (!($(gl).path).equals($enc)) {
    if ( ( test-path $enc ) ) { sl $enc } else { "$enc ain't there"; return } }
  foreach ($node in $encrypted) {
    ''
    scfcdc; $node; scrc
    if ( gci $node* ) {
      if ( $node.equals('actions') ) { $path = '*ps1*' } else {
        if ( test-path $node -pathtype container ) { $encContents = gci $node -recurse -file | sort lastwritetime -descending | select -first 9 | %{ dtsfn $_ '??' } } else { $encdir = '' }
        $path = $node+'*7z'
      }
      $enc7z = gci -path $path | %{ dtsfn $_ '**' }
      $ce7z = gci -path "$core\encrypted\$path" | %{ dtsfn $_ 'dr' }
      $objects = $encContents, $enc7z, $ce7z
      $encContents = ''  # incase a  $node  directory isn't in  $enc
      $flattened = @($objects | % {$_})  # optional
      $sorted = $flattened | ? { $_ } | sort -uniq  # also removes nulls
      $sorted.replace('C:\Users\jharr\', '').replace('Dropbox\JH\core\encrypted\', '').replace('encrypted\', '')
    }
  }
  ''
}

function lwp { gci -r | %{ dtsfn $_ ':' } | out-string -stream | ss $args[0] | sort }
#  $args[0]  is a regex, something in the filepath

#====> by name
function lwt {
  if ($args[0]) {
    $of = 'lwt-'+$args[0]+'.fetl'
    "" > $of
    if ($args[1]) { $a1 = '*.'+$args[1]
      if ($args[2]) { $a2 = '*.'+$args[2] }
      if ($args[3]) { $a3 = '*.'+$args[3] }
      "$a1 $a2 $a3" >> $of; "" >> $of
      lwts $a1 $a2 $a3 >> $of
      "results in $of"
    } else { "next three arguments are specific file extensions" }
  } else {
    "first argument should be the general descriptor of the type of files you're looking for"
  } } # examples in  $MSwin10\QR\cli.md

function lwt-gitignore {
  # "vim: ft=fetl:" > lwt-gitignore.txt; lwts .gitignore >> lwt-gitignore.txt } # specific case
  lwts .gitignore >> lwt-gitignore.fetl } # specific case

function lwts { gci -r -i $args[0],$args[1],$args[2] | %{ dtsfn $_ ':' } | sort }
#  can use wildcards in the <filenames(s)>

#===> sizes
function dc { gci | foreach-object { $_.name + ": " + "{0:n2}" -f ((gci $_ -recurse | measure-object length -sum -erroraction silentlycontinue).sum / 1mb) + " mb" } }

function du { du64 -nobanner -l 1 }

function fso { $fso = new-object -com scripting.filesystemobject; gci -directory | select @{l='size'; e={$fso.getfolder($_.fullname).size}},fullname | sort size -descending | ft @{l='size [mb]'; e={'{0:n2}    ' -f ($_.size / 1mb)}},fullname }

function gfsi { Get-ChildItem . -Directory | Get-FolderSizeInfo -Hidden | Sort-Object TotalSize -Descending | Format-Table -AutoSize -View mb }

#===> string in files - sifw's

function stringinallfiles { sifwork string-allfiles '*' $args[0] }
function stringinmds { sifwork string-md '*.md' $args[0] }
function stringinps1s { sifwork string-ps1 '*.ps1' $args[0] }
function stringintexs { $texfiles = '*.cls','*.tex'; sifwork string-latex $texfiles $args[0] }
function stringinvims { sifwork string-vim '*.vim' $args[0] }
# stringin* <regex>

function SE {
  $outfile = "$DJH/search/SEN.sifw"
  sifwork0 $outfile 'stackexchange|stackoverflow|superuser'
  foreach($ITd in $jtIT, $ITstack, "$JHw\France") {
    "Searching in $ITd\..."
    sl $ITd
    gci -r -e $outfile -i '*.md' | ss 'stackexchange|stackoverflow' | %{$_.path+" > "+$_.line} >> $outfile
    '' >> $outfile
  }
  sleep 4
  seco $outfile -value (gc $outfile | ss -pattern 'vimfiles\\pack' -notmatch)
  sifwork1 $outfile
  sl "$DJH/search"
}

function sifwork {
  # not to be called directly
  $outfile = $args[0]+".sifw"
  sifwork0 $outfile $args[2]
  gci -r -e $outfile -i $args[1] | ss $args[2] | %{$_.path+" > "+$_.line} >> $outfile
  "" >> $outfile
  sifwork1 $outfile
  $global:sifworkoutfile = $outfile
}
function sifwork0 {
  "" > $args[0]
  'vim /: '+$args[1].replace('|','\|') >> $args[0]
  "" >> $args[0]
} # header
function sifwork1 {
  "vim-easy-align: gAip>" >> $outfile
  ":packadd tabular | Tabularize/>" >> $outfile
  '' >> $outfile
  $outfile
} # footer

#====> github issues
# $jtIT\ghissues.sifw
# $ITstack\ghissues.sifw

function ghissues {
  'Searching...'
  stringinmds 'github\.com.+issues'  # calling function sifwork
  "Stripping issues that aren't mine..."
  $sifwof = '.\'+$global:sifworkoutfile  # global variable set in function sifwork
  sleep 3
  seco $sifwof -value (gc $sifwof | ss -pattern 'tmux-resurrect' -notmatch)
  sleep 3
  seco $sifwof -value (gc $sifwof | ss -pattern 'vimfiles\\pack' -notmatch)
  sleep 3
  seco $sifwof -value (gc $sifwof | ss -pattern 'vimfiles\\plugin\\fzf' -notmatch)
  sleep 3
  seco $sifwof -value (gc $sifwof | ss -pattern 'vimtest' -notmatch)
  mi $sifwof ghissues.sifw -force
  '- moved to ghissues.sifw'
}
#=> 0 Ghostscript
Function gsp {
    $pl = $args[0]
    $r = '-r'+$args[1]
    #  40  can be fine for photos
    #  400  can be good for texty pdf
    $DSF = $args[2]
    #  1 = no down-scale of size
    #  8 = maximum blurring down
    $pngs = $args[3]+'-%02d.png'
    $pdf = $args[4]+'.pdf'
    if ( test-path $pdf ) {
      $g = "gswin64c -dSAFER -sDEVICE=png16m $r -dDownScaleFactor=$DSF -sPageList=$pl -o $pngs '$pdf'"
    } else { "$pdf ain't there" }
    SCFCW; $g; SCRC; iex $g
    }
#  gsp <startPageNo>-<endPageNo> resolution DownScaleFactor(1-8) outPNGbaseName 'inPDFbaseName'

#=> 0 imagey
function fi {
  $wd = gl | select -expand path
  $pIF = "$wd-imageyFlat"
  if ( test-path $pIF ) { ri -r $pIF }
  [void](ni $pIF -type directory)
  $imagies = gci $wd -r -i *.jpeg,*.jpg,*.png,*.ogv | resolve-path -relative
  foreach ($imagey in $imagies) {$imagey.replace('.\','')}
  foreach ($imagey in $imagies) {
    $imageyReady = $imagey.replace('.\','')
    $imageyFlat = $imageyReady.replace('\','--')
    cpi "$wd\$imageyReady" "$pIF\$imageyFlat"
  }
} # gets a flattened directory alongside of imagies
# use  cex  to see what's imagey

#==> re-tag image files to 72dpi
# a single image file:
Function im72 {
  $72dpi=$args[0] -replace '((\.[^.]*)$)', '-72dpi$1'
  exiftool -filename=72dpi -xresolution=72 -yresolution=72 $args[0]; mi 72dpi $72dpi -force
  }

# all the files in a folder:
Function all72 {
  gci | Where-Object {-not $_.PsIsContainer} | ForEach-Object { im72 $_
  Remove-Item $_ }
  }

#=> 0 internetworking
function cc {
  $co = (Invoke-WebRequest http://ifconfig.co/country).Content.replace("`n",'')
  $ci = (Invoke-WebRequest http://ifconfig.co/city).Content.replace("`n",'')
  if ( $ci ) { "$ci, $co" } else { "$co" }
  }  # [city, ]country
function ip { (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content }  # IPv4
function tc {test-connection 8.8.8.8 -ErrorAction SilentlyContinue}
function tcg {test-connection google.com -ErrorAction SilentlyContinue}
function wp { curl wttr.in/Paris }

#==> yt-dlp
sal y yt-dlp
  function y7 { y -f '[height<=?720]' $args[0] }
  function yf { y -F $args[0] }

#=> 0 shell settings
$env:TERM = "xterm-256color"  # $vimfiles/nvim/lua/init.lua

if ($PSVersionTable.PSVersion.Major -eq 7) { ipmo Powershell.Chunks }

ipmo ps.checkModuleUpdates
ipmo PSScriptTools

# prompt
# 0 admin/debug contexts
$sp_identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$sp_principal = [Security.Principal.WindowsPrincipal] $sp_identity
$sp_adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator
$ps_context = $(if (test-path variable:/PSDebugContext) { '[DBG]: ' }
                elseif($sp_principal.IsInRole($sp_adminRole)) { "[ADMIN]: " }
                else { '' })
# 1 posh-git
ipmo posh-git; $GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::cyan
# 2 togglable prompt
function pp {
  if ($shortPrompt) {
    function global:prompt {
      # Pasted output of  $function:prompt  only after PowerShell is launched:
      $loc = gl
      $prompt = & $GitPromptScriptBlock
      $prompt += "$([char]27)]9;12$([char]7)"
      if ($loc.Provider.Name -eq "FileSystem")
        { $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\" }
      $ps_context + $prompt
    } # long prompt, using  posh-git
    $global:shortPrompt = $false
  } else {
    # function global:prompt { scfcdc; $ps_context + $(split-path $pwd -leaf) + '>'; scrc }
    function global:prompt {
      write-host ( $ps_context + $(split-path $pwd -leaf) + '>') -nonewline -ForegroundColor cyan
      return " "
    }
    $global:shortPrompt = $true
  }
}
$global:shortPrompt = $true; pp  # invokes my long prompt

#==> PSReadLine
Set-PSReadlineOption -EditMode Vi  # wipes out any other settings, so first

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# PSFzf additions
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

#=> 1 place-dependent
. $ITscc/forMSWin/code-minimap/_code-minimap.ps1  # $GHrUse/CP/wfxr-code-minimap/README.md
. $machBld\PSProfile.ps1

#==> documenting
function xc { iex "su $ITscr\CP\TeX\LaTeX\appearance\colour\xcolor.pdf -page 38" }

#===> MiKTeX
Function x { xelatex -halt-on-error --max-print-line=110 $args[1] $args[0] }

Function lj {
  Remove-Item -recurse $tex\latex\jo
  Copy-Item -recurse $ITstack\CrossPlatform\forLaTeX $tex\latex\jo
} # instead of a symlink to avoid snags if MiKTeX is uninstalled

#===> Pandoc
function headings0sty { cpi $MD4PDF/iih/headings0.sty $tex\latex\m4p\headings.sty -force } # will need a  miktex fndb refresh  after first run
function m4p { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4p.ps1 $args[0] $args[1] $args[2] $args[3] }
function m4ps0 { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4ps.ps1 $args[0] $args[1] $args[2] } # m4ps0 [-n] [-r] [-s]
function mt { sl $Drpbx\JH\core\TextNotes; [string]$Pwd; m4ps0 -s }

#==> Dropbox conflicted copies
$DropboxConflictedLog = ''

Function dcc0 {
  sl $Drpbx
  $dts = (Get-Date).ToString("yyMMdd-HHmmss")
  Set-Variable -scope 1 -Name 'DropboxConflictedLog' -Value "$Drpbx\conflicted\$dts.log"
  "scanning for conflicted copies in $Drpbx"
  $all = gci -r | ? Name -match ".+'s conflicted copy.+" | %{echo $_.fullname}
  # $new = $all | ? { $_ -notmatch 'C:\\Users\\troin\\Dropbox\\conflicted' }
  $new = $all | ? { $_ -notmatch '.*\\Dropbox\\conflicted' }
  'vim: nowrap:' > $DropboxConflictedLog
  '' >> $DropboxConflictedLog
  $new >> $DropboxConflictedLog
  gvim $DropboxConflictedLog
}  # lists them

Function dcc1 {
  if ( test-path $DropboxConflictedLog ) {
    $DropboxConflictedRemoved=$DropboxConflictedLog.Replace('.log','-removed')
    new-item $DropboxConflictedRemoved -type directory > $null
    $removedRestore = "$DropboxConflictedRemoved-restore.ps1"
    '# vim: nowrap:' > $removedRestore
    '' >> $removedRestore
    gc $DropboxConflictedLog | select-object -skip 2 | %{
      $removedRelativePath=$_.Replace("$Drpbx\",'')
      $removedFlattenedPath = $removedRelativePath.Replace('\','--')
      $removedFPNS = $removedFlattenedPath.Replace(' ','_')
      mi "$_" "$DropboxConflictedRemoved\$removedFPNS"
      "cpi `"$DropboxConflictedRemoved\$removedFPNS`" `"$_`"" >> $removedRestore
    }
    ri $DropboxConflictedLog
    gvim $removedRestore
  } else { "- you should've dcc0'd" | Out-HostColored dcc0 }
}  # removes them

#==> general tools
function xx { exit } # quit (doesn't work as an alias) ctrl+d is quicker
function fcco {Format-Custom -InputObject $args[0] -Expand CoreOnly}
# - shows summarised layout of array
function ffmhb { $f = "ffmpeg -hide_banner " + $args -join ' '
  $f = $f.Replace(' -c: a ', ' -c:a ')
  $f = $f.Replace(' -q: v ', ' -q:v ')
  iex "$f" } # no spaces or () in file names
Function fn { gci | select -ExpandProperty FullName | sort }
Function ga { git add $args[0] }
Function gic { git commit -m "$args[0]" }
Function gis { git status -u }
Function gvim { & "C:\Vim\vim91\gvim.exe" $args[0] $args[1] $args[2] }
Function tz { Get-MyTimeInfo -Locations ([ordered]@{"GMT" = "GMT Standard Time"}) -HomeTimeZone "Romance Standard Time" }
# New-Alias g gm.exe # GraphicsMagick
New-Alias jpo $onGH\jpgorhor\jpgorhor.ps1

#==> Jekyll
function js { sl $JHm; $JHm; bundle exec jekyll serve --drafts; }
function jt { sl $JHm; ri tag\*; python $JHm\_plugins\compile_tags.py; sl tag; }

#==> PSFzf
# Set-PsFzfOption -EnableAliasFuzzySetEverything  # cde  does nothing...
# Set-PsFzfOption -EnableAliasFuzzyZLocation  # fz  unfortunately kills  Alt+c...
# and settings for PSReadLine

# see  $MSWin10\quickReference.txt

#==> sharkdp/bat 
# completion
function f { Invoke-Fzf -preview 'bat --color=always {}' }
sal b bat
function bd { bat -d $args[0] }  # showing changes from git index

#==> shell - colours in outputs
. $MSWin10\Out-HostColored.ps1
Function SCFCDC { [System.Console]::ForegroundColor = 'DarkCyan' }  # scfcdc; "DarkCyan"; scrc
Function SCFCW { [System.Console]::ForegroundColor = 'White' }  # scfcw; "White"; scrc
Function SCRC { [System.Console]::ResetColor() }
ipmo Terminal-Icons

function Format-Color([hashtable] $Colors = @{}, [switch] $SimpleMatch) {
    $lines = ($input | Out-String) -replace "`r", "" -split "`n"
    foreach($line in $lines) {
        $color = ''
        foreach($pattern in $Colors.Keys){
            if(!$SimpleMatch -and $line -match $pattern) { $color = $Colors[$pattern] }
            elseif ($SimpleMatch -and $line -like $pattern) { $color = $Colors[$pattern] }
        }
        if($color) { write-host -ForegroundColor $color $line } else { write-host $line }
    }
}

#===> errors
# only affecting  Windows PowerShell
$host.privatedata.errorforegroundcolor = 'green'
$host.privatedata.ErrorBackgroundColor = 'darkmagenta'

