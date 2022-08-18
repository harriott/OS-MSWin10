
#  #region  &  #endregion  create folding blocks if Peter Provost's  vim-ps1  is installed

# Joseph Harriott, Tue 16 Aug 2022

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

#region --- 0 convert images recursively

Function mc {
  $format1 = $args[0]
  $format2 = $args[1]
  gci -r *.$format1 | %{
    $oi = $_.Name.Replace('.', '_')
    magick $_ $oi".$format2"
    ri $_
  }
} #  mc tiff jpg

#endregion
#region --- 0 file handling
function c { if ( $args[0] ) { sl $args[0] } else { sl .. }; pc }  # handily move in or out
function i { ii . }  # opens  file explorer  on current directory

function csl {
  $links = gci $args[0] -force | ?{$_.linktype} | select fullname,target

  foreach ($link in $links) {
    $lfn = $link | select -expand fullname
    $lt = $link | select -expand target
    $t = 'red'
    if ( test-path $lt ) { $t = 'green' }
    # write-color -text "$lfn, -> ", $lt -color white, green
    write-color -text "$lfn, -> ", $lt -color white, $t
    }
} #  shows good symlink targets in green, bad in red

#region --- investigations
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

#region --- filetypes
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

#endregion
#region --- lastwritetime

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

#region --- by name
function lwt {
  if ($args[0]) {
    $of = 'lwt-'+$args[0]+'.txt'
    "vim: ft=ftlist:" > $of; "" >> $of
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
  # "vim: ft=ftlist:" > lwt-gitignore.txt; lwts .gitignore >> lwt-gitignore.txt } # specific case
  lwts .gitignore >> lwt-gitignore.ftlist } # specific case

function lwts { gci -r -i $args[0],$args[1],$args[2] | %{ dtsfn $_ ':' } | sort }
#  can use wildcards in the <filenames(s)>

#endregion

#endregion
#region --- sizes
function dc { gci | foreach-object { $_.name + ": " + "{0:n2}" -f ((gci $_ -recurse | measure-object length -sum -erroraction silentlycontinue).sum / 1mb) + " mb" } }

function fso { $fso = new-object -com scripting.filesystemobject; gci -directory | select @{l='size'; e={$fso.getfolder($_.fullname).size}},fullname | sort size -descending | ft @{l='size [mb]'; e={'{0:n2}    ' -f ($_.size / 1mb)}},fullname }

function gfsi { Get-ChildItem . -Directory | Get-FolderSizeInfo -Hidden | Sort-Object TotalSize -Descending | Format-Table -AutoSize -View mb }

#endregion
#region --- strings in files

function stringinallfiles { sifwork string-allfiles '*' $args[0] }
function stringinmds { sifwork string-md '*.md' $args[0] }
function stringinps1s { sifwork string-ps1 '*.ps1' $args[0] }
function stringintexs { $texfiles = '*.cls','*.tex'; sifwork string-latex $texfiles $args[0] }
function stringinvims { sifwork string-vim '*.vim' $args[0] }

function sifwork {
  # not to be called directly
  $outfile = $args[0]+".list"
  "vim: ft=sif:" > $outfile
  "" >> $outfile
  $args[2] >> $outfile
  "" >> $outfile
  gci -r -e $outfile -i $args[1] | ss $args[2] | %{$_.path+" > "+$_.line} >> $outfile
  "" >> $outfile
  "vim-easy-align: gaip>" >> $outfile
  ":tabularize/>" >> $outfile
  '' >> $outfile
  $outfile
  $global:sifworkoutfile = $outfile
  }

#region --- github issues
# $it1\ghissues.list
# $itstack\ghissues.list

function ghissues {
  stringinmds 'github.com.+issues'
  $sifwof = '.\'+$global:sifworkoutfile  # as set in  function sifwork
  sleep 1
  set-content $sifwof -value (gc $sifwof | select-string -pattern 'tmux-resurrect' -notmatch)
  sleep 1
  set-content $sifwof -value (gc $sifwof | select-string -pattern 'vimfiles\\pack' -notmatch)
  sleep 1
  set-content $sifwof -value (gc $sifwof | select-string -pattern 'vimfiles\\plugin\\fzf' -notmatch)
  mi $sifwof ghissues.list -force
  '- moved to ghissues.list' 
}
#endregion
#endregion
#endregion
#endregion
#region --- 0 Ghostscript

$env:path +=';C:\Program Files\gs\gs9.54.0\bin'
Function gsp {
    $pl = $args[0]
    $r = '-r'+$args[1]
    #  40  can be fine for photos
    #  700  can be good for texty pdf
    $pngs = $args[2]+'-%02d.png'
    $pdf = $args[3]+'.pdf'
    if ( test-path $pdf ) {
      $g = "gswin64c -dSAFER -sDEVICE=png16m $r -sPageList=$pl -o $pngs '$pdf'"
    } else { "$pdf ain't there" }
    SCFCW; $g; SCRC; iex $g
    }
#  gsp <startPageNo>-<endPageNo> resolution outPNGbaseName 'inPDFbaseName'

#endregion
#region --- 0 internetworking

Function cc {
  $co = (Invoke-WebRequest http://ifconfig.co/country).Content.replace("`n",'')
  $ci = (Invoke-WebRequest http://ifconfig.co/city).Content.replace("`n",'')
  if ( $ci ) { "$ci, $co" } else { "$co" }
  }  # [city, ]country
Function ip { (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content }  # IPv4
Function p {test-connection -computername 8.8.8.8 -ErrorAction SilentlyContinue}
Function pg {test-connection -computername google.com -ErrorAction SilentlyContinue}
Function wp { curl wttr.in/Paris }

#endregion
#region --- 0 places

$UN = $Env:USERNAME
$DROPBOX = "C:\Users\$UN\Dropbox"
  $core = "$DROPBOX\JH\core"
    $ITstack = "$core\IT_stack"
      $CP = "$ITstack\CrossPlatform"
      $onGH = "$ITstack\onGitHub"
        $Cn = $Env:Computername
        $MSwin10 = "$onGH\MSWin10"
          $machine = "$MSWin10\$Cn"
        $SPD = "$onGH\SyncPortableDrives\RoboCopy\$Cn"  # see below
        $vimfiles = "$onGH\vimfiles"
  $IT1 = "$DROPBOX\JH\technos\IT1"
  $ITP = "$DROPBOX\JH\Technos\IT0-Partitionable"  # $ITP\diskUsage.txt
  $cITh = "$DROPBOX\JH\copied\IT-handy"
$Enc = "C:\Users\$UN\encrypted"

#endregion
#region --- 0 re-tag image files to 72dpi

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

#endregion
#region --- 0 shell settings

$env:path +=';C:\Program Files\7-Zip'

if ($PSVersionTable.PSVersion.Major -eq 7) { Import-Module Powershell.Chunks }

Import-Module posh-git
$GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::Cyan

Import-Module ps.checkModuleUpdates

#region --- colours in outputs
. $MSWin10\Out-HostColored.ps1
Function SCFCDC { [System.Console]::ForegroundColor = 'DarkCyan' }  # scfcdc; "DarkCyan"; scrc
Function SCFCW { [System.Console]::ForegroundColor = 'White' }  # scfcw; "White"; scrc
Function SCRC { [System.Console]::ResetColor() }
# SCFCW; "DarkCyan"; "White"; SCRC
Import-Module Terminal-Icons; Import-Module PowerColorLS
Set-Alias pc PowerColorLS

#region --- errors
$host.privatedata.ErrorForegroundColor = 'DarkGray'
$host.privatedata.ErrorBackgroundColor = 'darkmagenta'
#endregion

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

#endregion
#region --- PSReadLine

Set-PSReadlineOption -EditMode Vi  # wipes out any other settings, so first

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# PSFzf additions
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

#endregion
#endregion
#region --- 1 place-dependent
. $machine\PSProfile.ps1  # also uses $onGH ($MSWin10/PSProfile.ps1)

#region --- 1 documenting
  Function xc { iex "$Env:LocalAppData\SumatraPDF\SumatraPDF.exe $Dropbox\JH\Copied\IT-handy\TeX\LaTeX\Appearance\xcolor.pdf -page 38" }

#region --- MiKTeX
  Function x { xelatex --max-print-line=110 $args[0] }

  Function lj {
    Remove-Item -recurse $tex\latex\jo
    Copy-Item -recurse $ITstack\CrossPlatform\forLaTeX $tex\latex\jo
  } # instead of a symlink to avoid snags if MiKTeX is uninstalled
#endregion
#region --- Pandoc
  # helps to define these also in  $HOME\_vimrc
  $tex = "$Env:AppData\MiKTeX\tex"
  $Pandoc = "$Env:AppData\Pandoc"
    $MD4PDF = "$onGH\md4pdf"

  Function headings0sty { cpi $MD4PDF/iih/headings0.sty $tex\latex\m4p\headings.sty -force }
  Function m4p { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4p.ps1 $args[0] $args[1] $args[2] }
  Function m4ps0 { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4ps.ps1 $args[0] $args[1] $args[2] }
  Function mt { sl $DROPBOX\JH\core\TextNotes; [string]$Pwd; m4ps0 -s }

#endregion
#endregion
#region --- 1 Dropbox conflicted copies
  $DropboxConflictedLog = ''

  Function dcc0 {
    sl $DROPBOX
    $dts = (Get-Date).ToString("yyMMdd-HHmmss")
    Set-Variable -scope 1 -Name 'DropboxConflictedLog' -Value "$DROPBOX/conflicted/$dts.log"
    'scanning for conflicted copies'
    $all = gci -r | ? Name -match ".+'s conflicted copy.+" | %{echo $_.fullname}
    $new = $all | ? { $_ -notMatch ('C:\\Users\\troin\\Dropbox\\conflicted' -Join "|") }
    $new > $DropboxConflictedLog
    gvim $DropboxConflictedLog
  }  # lists them

  Function dcc1 {
    $DropboxConflictedLog = 'C:\Users\troin\Dropbox\conflicted\220722-164647.log'
    if ( test-path $DropboxConflictedLog ) {
      $DropboxConflictedRemoved=$DropboxConflictedLog.Replace('.log','-removed')
      new-item $DropboxConflictedRemoved -type directory > $null
      gc $DropboxConflictedLog | %{
        $removedRelativePath=$_.Replace("$DROPBOX\",'')
        $removedFlattenedPath=$removedRelativePath.Replace('\','--')
        mi $_ "$DropboxConflictedRemoved\$removedFlattenedPath"
      }
      $removedLog = "$DropboxConflictedRemoved.log"
      mi $DropboxConflictedLog $removedLog
      gvim $removedLog
    } else { "- you should've dcc0'd" | Out-HostColored dcc0 }
  }  # removes them

#endregion
#region --- 1 general tools

Function e { exit } # quit (doesn't work as an alias)
Function fcco {Format-Custom -InputObject $args[0] -Expand CoreOnly}
# - shows summarised layout of array
Function ffmhb {ffmpeg -hide_banner $args}
Function fn { gci | select -ExpandProperty FullName | sort }
Function ga { git add $args[0] }
Function gic { git commit -m "$args[0]" }
Function gis { git status -u }
Function gvim { & "C:\Vim\vim82\gvim.exe" $args[0] $args[1] $args[2] }
Function tz { Get-MyTimeInfo -Locations ([ordered]@{"GMT" = "GMT Standard Time"}) -HomeTimeZone "Romance Standard Time" }
# New-Alias g gm.exe # GraphicsMagick
New-Alias jpo $onGH\jpgorhor\jpgorhor.ps1

Function l {
  [string[]]$list = (gci).Name
  $list -join '  '
}

#endregion
#region --- 1 PSFzf

# Set-PsFzfOption -EnableAliasFuzzySetEverything  # cde  does nothing...
# Set-PsFzfOption -EnableAliasFuzzyZLocation  # fz  unfortunately kills  Alt+c...
# and settings for PSReadLine

# see  $MSWin10\quickReference.txt

#endregion
#endregion
