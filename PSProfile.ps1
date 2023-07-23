
# Joseph Harriott, Mon 26 Sep 2022

# symlink this file ($MSWin10\PSProfile.ps1) to
#  ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
#  ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#   - both done in  $MSWin10\symlinks.ps1

Set-Alias seco Set-Content  # because  sc  is overridden by  sc.exe
Set-Alias ss Select-String

Function GNFR {
  $FRlist = Get-NetFirewallRule | out-string
  $FRlf = "$machine\troin\FirewallRules.txt"
  "vim: set ft=NFR:" > $FRlf
  $FRlist.TrimEnd() >> $FRlf
  '' >> $FRlf
}

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
function tt { ri "*.aux"; ri "*.log" }  # tidy tex = clear away TeX ancillary files

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

#==> investigations
function gfiln { gci -r $args[0] | select -expandproperty fullname }
function gfoln { gci -r $args[0] | where { $_.psiscontainer } | select -expandproperty fullname }

function t {
  $d = $args[0]
  if ( $d ) { $d = "-Depth $d" }
  $pst = "pstree -InColor -ShowItem $d"
  $pst
  iex $pst
  }

set-alias j z  # zlocation

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

#===> lastwritetime
function dtsfn { $args[0].lastwritetime.tostring('yyyymmdd-hh:mm:ss')+' '+$args[1]+' '+ $args[0].fullname }
# - used by other functions

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
      $enc7z = gci -path $path | %{ dtsfn $_ '**' }
      $ce7z = gci -path "$core\encrypted\$path" | %{ dtsfn $_ 'dr' }
      $objects = $encdir, $enc7z, $ce7z
      $flattened = @($objects | % {$_})  # optional
      $sorted = $flattened | ? { $_ } | sort -uniq  # also removes nulls
      $sorted.replace('C:\Users\troin\', '').replace('Dropbox\JH\core\encrypted\', '').replace('encrypted\', '')
    }
  }
  ''
}

function lwp { ls -r | %{ dtsfn $_ ':' } | out-string -stream | select-string $args[0] | sort }
#  <file-path> is a regex

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
  } } # examples in  $mswin10\quickreference.txt

function lwt-gitignore {
  # "vim: ft=fetl:" > lwt-gitignore.txt; lwts .gitignore >> lwt-gitignore.txt } # specific case
  lwts .gitignore >> lwt-gitignore.fetl } # specific case

function lwts { gci -r -i $args[0],$args[1],$args[2] | %{ dtsfn $_ ':' } | sort }
#  can use wildcards in the <filenames(s)>

#===> sizes
function dc { gci | foreach-object { $_.name + ": " + "{0:n2}" -f ((gci $_ -recurse | measure-object length -sum -erroraction silentlycontinue).sum / 1mb) + " mb" } }

function fso { $fso = new-object -com scripting.filesystemobject; gci -directory | select @{l='size'; e={$fso.getfolder($_.fullname).size}},fullname | sort size -descending | ft @{l='size [mb]'; e={'{0:n2}    ' -f ($_.size / 1mb)}},fullname }

function gfsi { Get-ChildItem . -Directory | Get-FolderSizeInfo -Hidden | Sort-Object TotalSize -Descending | Format-Table -AutoSize -View mb }

#===> string in files

function stringinallfiles { sifwork string-allfiles '*' $args[0] }
function stringinmds { sifwork string-md '*.md' $args[0] }
function stringinps1s { sifwork string-ps1 '*.ps1' $args[0] }
function stringintexs { $texfiles = '*.cls','*.tex'; sifwork string-latex $texfiles $args[0] }
function stringinvims { sifwork string-vim '*.vim' $args[0] }

function sifwork {
  # not to be called directly
  $outfile = $args[0]+".sifw"
  "" > $outfile
  'string in files - see  $MSWin10\PSProfile.ps1' > $outfile
  "" > $outfile
  $args[2] >> $outfile
  "" >> $outfile
  gci -r -e $outfile -i $args[1] | ss $args[2] | %{$_.path+" > "+$_.line} >> $outfile
  "" >> $outfile
  "vim-easy-align: gAip>" >> $outfile
  ":packadd tabular | Tabularize/>" >> $outfile
  '' >> $outfile
  $outfile
  $global:sifworkoutfile = $outfile
  }

#====> github issues
# $jtIT\ghissues.sifw
# $ITstack\ghissues.sifw

function ghissues {
  'Searching...'
  stringinmds 'github\.com.+issues'  # calling function sifwork
  "Stripping issues that aren't mine..."
  $sifwof = '.\'+$global:sifworkoutfile  # global variable set in function sifwork
  sleep 3
  set-content $sifwof -value (gc $sifwof | select-string -pattern 'tmux-resurrect' -notmatch)
  sleep 3
  set-content $sifwof -value (gc $sifwof | select-string -pattern 'vimfiles\\pack' -notmatch)
  sleep 3
  set-content $sifwof -value (gc $sifwof | select-string -pattern 'vimfiles\\plugin\\fzf' -notmatch)
  mi $sifwof ghissues.sifw -force
  '- moved to ghissues.sifw'
}
#====> SE
# $ITstack\SE.sifw

function SE {
  'Searching...'
  stringinmds 'stackexchange'
  $sifwof = '.\'+$global:sifworkoutfile  # as set in  function sifwork
  mi $sifwof SE.sifw -force
  '- moved to SE.sifw'
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

#=> 0 internetworking
Function cc {
  $co = (Invoke-WebRequest http://ifconfig.co/country).Content.replace("`n",'')
  $ci = (Invoke-WebRequest http://ifconfig.co/city).Content.replace("`n",'')
  if ( $ci ) { "$ci, $co" } else { "$co" }
  }  # [city, ]country
Function ip { (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content }  # IPv4
Function p {test-connection -computername 8.8.8.8 -ErrorAction SilentlyContinue}
Function pg {test-connection -computername google.com -ErrorAction SilentlyContinue}
Function wp { curl wttr.in/Paris }

#=> 0 places
$uname = $Env:USERNAME
$Drpbx = "C:\Users\$uname\Dropbox"
  $DJH = "$Drpbx\JH"
    $core = "$DJH\core"
      $ITstack = "$core\IT_stack"
        $CrPl = "$ITstack\CP"
        $onGH = "$ITstack\onGitHub"
          $Cn = $Env:Computername
          $MSwin10 = "$onGH\OS-MSWin10"
            $machine = "$MSWin10\$Cn"
          $SPD = "$onGH\SyncPortableDrives\RoboCopy\$Cn"  # see below
          $vimfiles = "$onGH\vimfiles"
    $GHrUse = "$DJH\CGHrepos"  # GitHub Repositories Use
    $JHw = "$DJH\work"  # for IT websites and more
      $Jhm="$JHw\IT-Jekyll-harriott-minima"
    $jtIT = "$DJH\technos\IT"
    $tIs = "$DJH\Technos\IT-storage"  # $tIs\diskUsage.txt
    $Pr0 = "$DJH\Copied\Practical0"
    $Thb = "$DJH\Thbdr"
$Enc = "C:\Users\$uname\encrypted"

#=> 0 re-tag image files to 72dpi
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

#=> 0 shell settings
$env:path +=';C:\Program Files\7-Zip'

if ($PSVersionTable.PSVersion.Major -eq 7) { Import-Module Powershell.Chunks }

Import-Module posh-git
$GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::Cyan

Import-Module ps.checkModuleUpdates

#==> colours in outputs
. $MSWin10\Out-HostColored.ps1
Function SCFCDC { [System.Console]::ForegroundColor = 'DarkCyan' }  # scfcdc; "DarkCyan"; scrc
Function SCFCW { [System.Console]::ForegroundColor = 'White' }  # scfcw; "White"; scrc
Function SCRC { [System.Console]::ResetColor() }
# SCFCW; "DarkCyan"; "White"; SCRC
Import-Module Terminal-Icons; Import-Module PowerColorLS
Set-Alias pc PowerColorLS

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
$host.privatedata.ErrorForegroundColor = 'DarkGray'
$host.privatedata.ErrorBackgroundColor = 'darkmagenta'

#==> PSReadLine
Set-PSReadlineOption -EditMode Vi  # wipes out any other settings, so first

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# PSFzf additions
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

#=> 0 Vifm
$env:path +=';C:\vifm-w64-se-0.12-binary'

#=> Jekyll
function js { sl $JHm; $JHm; bundle exec jekyll serve; }
function jt { sl $JHm; ri tag\*; python $JHm\_plugins\compile_tags.py; sl tag; }

#=> 1 place-dependent
. $GHrUse\CP\wfxr-code-minimap\completions\powershell\_code-minimap.ps1
# $GHrUse/CP/wfxr-code-minimap/completions/README.md
# $GHrUse\CP\wfxr-code-minimap\completions\README.md
. $machine\PSProfile.ps1  # also uses $onGH ($MSWin10/PSProfile.ps1)

#==> bat
. $MSwin10\_bat.ps1
# completion
function f { Invoke-Fzf -preview 'bat --color=always {}' }
Set-Alias b bat
function bd { bat -d $args[0] }  # showing changes from git index

#==> documenting
Function xc { iex "$Env:LocalAppData\SumatraPDF\SumatraPDF.exe $Drpbx\JH\Copied\IT-handy\TeX\LaTeX\Appearance\xcolor.pdf -page 38" }

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
  $MD4PDF = "$onGH\md4pdf"

Function headings0sty { cpi $MD4PDF/iih/headings0.sty $tex\latex\m4p\headings.sty -force }
Function m4p { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4p.ps1 $args[0] $args[1] $args[2] $args[3] }
Function m4ps0 { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4ps.ps1 $args[0] $args[1] $args[2] }
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
  iex "$f" }
Function fn { gci | select -ExpandProperty FullName | sort }
Function ga { git add $args[0] }
Function gic { git commit -m "$args[0]" }
Function gis { git status -u }
Function gvim { & "C:\Vim\vim90\gvim.exe" $args[0] $args[1] $args[2] }
Function tz { Get-MyTimeInfo -Locations ([ordered]@{"GMT" = "GMT Standard Time"}) -HomeTimeZone "Romance Standard Time" }
# New-Alias g gm.exe # GraphicsMagick
New-Alias jpo $onGH\jpgorhor\jpgorhor.ps1

Function l {
  [string[]]$list = (gci).Name
  $list -join '  '
}

#==> PSFzf
# Set-PsFzfOption -EnableAliasFuzzySetEverything  # cde  does nothing...
# Set-PsFzfOption -EnableAliasFuzzyZLocation  # fz  unfortunately kills  Alt+c...
# and settings for PSReadLine

# see  $MSWin10\quickReference.txt

