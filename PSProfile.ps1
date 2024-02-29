
# Joseph Harriott, Mon 26 Sep 2022

# symlink this file ($MSWin10\PSProfile.ps1) to
#  ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
#  ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#   - both done in  $MSWin10\symlinks.ps1

sal seco set-content  # because  sc  is overridden by  sc.exe
sal ss select-string
sal su C:\SumatraPDF\SumatraPDF.exe

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
  $wli = "$machLg/winget_list"
  winget ls > $wli
  $wlit  = "$wli.txt"
  (gc $wli -raw) -replace "(?s).*------" > $wlit
  ri $wli
  gc $wlit | sort | select -skip 2 | seco $wlit
  'winget list  is in  $machLg/winget_list.txt'
}

function stc {
  '"Nom de la tâche","Prochaine exécution","Statut"' > $machLg\schtasks.csv
  schtasks /fo csv /nh | sort-object | out-file -append $machlg\schtasks.csv
}
# ( schtasks /fo list | out-file $machlg\schtasks.txt -encoding utf8bom )

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
set-alias j z  # ZLocation

#==> changes
function chco {
    $afs = gci -recurse . | sls -pattern $args[0] | select -expand path
    foreach ($af in $afs) {
      $af; (get-content $af) -replace $args[0], $args[1] | Set-Content $af
    }
  } # (release files for: change contents)  chco '\$m' '$mmm'

function tt { ri "*.aux"; ri "*.log" }  # tidy tex = clear away TeX ancillary files

#==> investigations
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
  if (!($(get-location).path).equals($enc)) {
    if ( ( test-path $enc ) ) { sl $enc } else { "$enc ain't there"; return } }
  foreach ($node in $encrypted) {
    ''
    scfcdc; $node; scrc
    if ( gci $node* ) {
      if ( $node.equals('actions') ) { $path = '*ps1*' } else {
        if ( test-path $node -pathtype container ) { $encdir = gci $node -recurse -file | sort lastwritetime -descending | select -first 9 | %{ dtsfn $_ '??' } } else { $encdir = '' }
        $path = $node+'*7z'
      }
      $path
      # $enc7z = gci -path $path | %{ dtsfn $_ '**' }
      # $ce7z = gci -path "$core\encrypted\$path" | %{ dtsfn $_ 'dr' }
      # $objects = $encdir, $enc7z, $ce7z
      # $flattened = @($objects | % {$_})  # optional
      # $sorted = $flattened | ? { $_ } | sort -uniq  # also removes nulls
      # $sorted.replace('C:\Users\troin\', '').replace('Dropbox\JH\core\encrypted\', '').replace('encrypted\', '')
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
$env:path +=';C:\Program Files\gs\gs9.54.0\bin'
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
function p {test-connection -computername 8.8.8.8 -ErrorAction SilentlyContinue}
function pg {test-connection -computername google.com -ErrorAction SilentlyContinue}
function wp { curl wttr.in/Paris }

#==> yt-dlp
sal y yt-dlp
  function y7 { y -f '[height<=?720]' $args[0] }
  function yf { y -F $args[0] }

#=> 0 places
$uname = $Env:USERNAME
  $Drpbx = "C:\Users\$uname\Dropbox"
    $DJH = "$Drpbx\JH"
      $Cfzd = "$DJH\Cafezoide"
        $CzPhy = "$Cfzd\PhysicalProperty"
      $copied = "$DJH\copied"
        $cITh = "$copied\IT-handy"
      $core = "$DJH\core"
        $ITstack = "$core\IT_stack"
          $CrPl = "$ITstack\CP"
            $LTXj = "$CrPl\documenting\LaTeX\jo"
          $ITsc = "$ITstack\copied"
          $onGH = "$ITstack\onGitHub"
            $Cn = $Env:Computername
              $machLg = "$ITstack\MSWin\ml-$Cn"
            $MSwin10 = "$onGH\OS-MSWin10"
              $machBld = "$MSWin10\mb-$Cn"
            $SPD = "$onGH\FM-MSWin-syncDrives\RoboCopy\$Cn"  # used in  $machBld\PSProfile.ps1
            $vimfiles = "$onGH\vimfiles"
              $vfp = "$vimfiles\pack"
      $GHrUse = "$Drpbx\CGHrepos"  # GitHub Repositories Use
      $JHw = "$DJH\work"  # for IT websites and more
        $JHm = "$JHw\IT-Jekyll-harriott-minima"
        $rEr = "$JHw\France\IdF\Paris\20e-rueErmitage"
          $StEr = "$rEr\StudioErmitage"  # $StEr
      $jtIT = "$DJH\technos\IT"
      $tIs = "$DJH\Technos\IT-storage"  # $tIs\diskUsage.txt
      $Pr0 = "$DJH\Copied\Practical0"
      $Thb = "$DJH\Thb-dr"
  $Enc = "C:\Users\$uname\encrypted"

#=> 0 shell settings 0
$env:path +=';C:\Program Files\7-Zip'

if ($PSVersionTable.PSVersion.Major -eq 7) { Import-Module Powershell.Chunks }

Import-Module posh-git
  $GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::Cyan

Import-Module ps.checkModuleUpdates
Import-Module PSScriptTools

#==> colours in outputs
. $MSWin10\Out-HostColored.ps1
Function SCFCDC { [System.Console]::ForegroundColor = 'DarkCyan' }  # scfcdc; "DarkCyan"; scrc
Function SCFCW { [System.Console]::ForegroundColor = 'White' }  # scfcw; "White"; scrc
Function SCRC { [System.Console]::ResetColor() }
# SCFCW; "DarkCyan"; "White"; SCRC
Import-Module Terminal-Icons; Import-Module PowerColorLS
sal pc PowerColorLS

function Format-Color([hashtable] $Colors = @{}, [switch] $SimpleMatch) {
    $lines = ($input | Out-String) -replace "`r", "" -split "`n"
    foreach($line in $lines) {
        $color = ''
        foreach($pattern in $Colors.Keys){
            if(!$SimpleMatch -and $line -match $pattern) { $color = $Colors[$pattern] }
            elseif ($SimpleMatch -and $line -like $pattern) { $color = $Colors[$pattern] }
        }
        if($color) { Write-Host -ForegroundColor $color $line } else { Write-Host $line }
    }
}

#===> errors
# only affecting  Windows PowerShell
$host.privatedata.errorforegroundcolor = 'green'
$host.privatedata.ErrorBackgroundColor = 'darkmagenta'

#==> PSReadLine
Set-PSReadlineOption -EditMode Vi  # wipes out any other settings, so first

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# PSFzf additions
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

#=> 0 shell settings 1 new tab in same directory
function prompt {
  $loc = gl
  $prompt = & $GitPromptScriptBlock
  $prompt += "$([char]27)]9;12$([char]7)"
  if ($loc.Provider.Name -eq "FileSystem")
    { $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\" }
  $prompt
} # ctrl+shift+d  now opens a new tab in same directory

#=> 0 Vifm
$env:path +=';C:\vifm-w64-se-0.12-binary'

#=> 1 place-dependent
# cp $GHrUse/CP/wfxr-code-minimap/completions/powershell/_code-minimap.ps1 $ITsc/forMSWin/_code-minimap.ps1
. $ITsc/forMSWin/_code-minimap.ps1
# $GHrUse/CP/wfxr-code-minimap/README.md
. $machBld\PSProfile.ps1  # also uses $onGH ($MSWin10/PSProfile.ps1)

#==> bat
. $MSwin10\_bat.ps1
# completion
function f { Invoke-Fzf -preview 'bat --color=always {}' }
sal b bat
function bd { bat -d $args[0] }  # showing changes from git index

#==> documenting
function xc { iex "$Env:LocalAppData\SumatraPDF\SumatraPDF.exe $Drpbx\JH\Copied\IT-handy\TeX\LaTeX\Appearance\xcolor.pdf -page 38" }

#===> MiKTeX
Function x { xelatex -halt-on-error --max-print-line=110 $args[1] $args[0] }

Function lj {
  Remove-Item -recurse $tex\latex\jo
  Copy-Item -recurse $ITstack\CrossPlatform\forLaTeX $tex\latex\jo
} # instead of a symlink to avoid snags if MiKTeX is uninstalled

#===> Pandoc
# helps to define these also in  $HOME\_vimrc
$tex = "$Env:AppData\MiKTeX\tex"
$Pandoc = "$Env:AppData\Pandoc"
  $MD4PDF = "$onGH\pandoc-md4pdf"

Function headings0sty { cpi $MD4PDF/iih/headings0.sty $tex\latex\m4p\headings.sty -force }
Function m4p { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4p.ps1 $args[0] $args[1] $args[2] $args[3] }
Function m4ps0 { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4ps.ps1 $args[0] $args[1] $args[2] } # m4ps0 [-n] [-r] [-s]
Function mt { sl $Drpbx\JH\core\TextNotes; [string]$Pwd; m4ps0 -s }

#==> Dropbox conflicted copies
$DropboxConflictedLog = ''

Function dcc0 {
  sl $Drpbx
  $dts = (Get-Date).ToString("yyMMdd-HHmmss")
  Set-Variable -scope 1 -Name 'DropboxConflictedLog' -Value "$Drpbx\conflicted\$dts.log"
  "scanning for conflicted copies in $Drpbx"
  $all = gci -r | ? Name -match ".+'s conflicted copy.+" | %{echo $_.fullname}
  $new = $all | ? { $_ -notmatch 'C:\\Users\\troin\\Dropbox\\conflicted' }
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
Function e { exit } # quit (doesn't work as an alias)
Function fcco {Format-Custom -InputObject $args[0] -Expand CoreOnly}
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

Function l {
  [string[]]$list = (gci).Name
  $list -join '  '
}

#==> Jekyll
function js { sl $JHm; $JHm; bundle exec jekyll serve --drafts; }
function jt { sl $JHm; ri tag\*; python $JHm\_plugins\compile_tags.py; sl tag; }

#==> PSFzf
# Set-PsFzfOption -EnableAliasFuzzySetEverything  # cde  does nothing...
# Set-PsFzfOption -EnableAliasFuzzyZLocation  # fz  unfortunately kills  Alt+c...
# and settings for PSReadLine

# see  $MSWin10\quickReference.txt

