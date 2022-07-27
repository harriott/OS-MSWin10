
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott, Tue 19 Jul 2022
# sourced by  $machine\PSProfile.ps1

Set-Alias ss Select-String

Function GNFR {
  $FRlist = Get-NetFirewallRule | out-string
  $FRlf = "$machine\troin\FirewallRules.txt"
  "vim: set ft=NFR:" > $FRlf
  $FRlist.TrimEnd() >> $FRlf
  '' >> $FRlf
}
#region --- convert images recursively

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
#region --- documenting
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
#region --- Dropbox conflicted copies
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
#region --- folder investigations
  Function gfiln { gci -r $args[0] | select -ExpandProperty FullName }
  Function gfoln { gci -r $args[0] | where { $_.PSIsContainer } | select -ExpandProperty FullName }

Set-Alias j z  # ZLocation

#region --- filetypes
  Function cex { gci . -r | where { ! $_.PSIsContainer } | Group Extension -noElement | Sort Count -Desc }

  Function Tomalak {
# https://stackoverflow.com/questions/15064758/summarize-a-file-system-directory-with-powershell
  gci -r -ea si `
    | select `
        Length, `
        @{n="FileType"; e={ if ($_.PSIsContainer) {""} else {$_.Extension.ToLower()} }}, `
        @{n="PathLength"; e={$_.FullName.Length}}, `
        @{n="PathDepth"; e={$_.FullName.Split("\").Length - 1}} `
    | group FileType `
    | sort @{e="Count"; desc=$True}, FileType `
    | select `
        Name, `
        Count, `
        @{n="Length"; e={$_.Group | measure Length -sum -average} }, `
        @{n="PathLength"; e={$_.Group | measure PathLength -max -average} }, `
        @{n="PathDepth"; e={$_.Group | measure PathDepth -max -average} } `
    | ft `
        @{n="FileType"; e={$_.Name} }, `
        Count, `
        @{n="SumSizeMB"; e={"{0:N1}" -f ($_.Length.Sum / 1MB)}; a="right"}, `
        @{n="AvgSizeKB"; e={"{0:N2}" -f ($_.Length.Average / 1MB)}; a="right"}, `
        @{n="MaxPathLength"; e={[int]$_.PathLength.Maximum}; a="right"}, `
        @{n="AvgPathLength"; e={[int]$_.PathLength.Average}; a="right"}, `
        @{n="MaxPathDepth"; e={[int]$_.PathDepth.Maximum}; a="right"}, `
        @{n="AvgPathDepth"; e={[int]$_.PathDepth.Average}; a="right"} `
        -auto
    }

#endregion
#region --- LastWriteTime

Function dtsFN { $args[0].LastWriteTime.ToString('yyyyMMdd-HH:mm:ss')+' '+$args[1]+' '+ $args[0].FullName }
#  used by other functions

Function encrypted {
  $Encrypted = "actions", "Digital0", "Digital1", "Secure0", "Secure1", "SHG", "stack"
  if (!($(get-location).path).equals($Enc)) {
    if ( ( test-path $Enc ) ) { sl $Enc } else { "$Enc ain't there"; Return } }
  foreach ($node in $Encrypted) {
    ''
    SCFCDC; $node; SCRC
    if ( gci $node* ) {
      if ( $node.equals('actions') ) { $path = '*ps1*' } else {
        if ( test-path $node -PathType Container ) { $EncDir = gci $node -Recurse -File | sort LastWriteTime -Descending | select -First 3 | %{ dtsFN $_ '??' } } else { $EncDir = '' }
        $path = $node+'*7z'
      }
      $Enc7z = gci -Path $path | %{ dtsFN $_ '**' }
      $ce7z = gci -Path "$core\encrypted\$path" | %{ dtsFN $_ 'Dr' }
      $objects = $EncDir, $Enc7z, $ce7z
      $flattened = @($objects | % {$_})  # optional
      $sorted = $flattened | ? { $_ } | sort -uniq  # also removes nulls
      $sorted.Replace('C:\Users\troin\', '').Replace('Dropbox\JH\core\encrypted\', '').Replace('Encrypted\', '')
    }
  }
  ''
}

Function lwp { ls -r | %{ dtsFN $_ ':' } | out-string -stream | select-string $args[0] | sort }
#  <file-path> is a regex

#region --- by name
Function lwt {
  if ($args[0]) {
    $of = 'lwt-'+$args[0]+'.txt'
    "vim: ft=ftlist nowrap tw=0:" > $of; "" >> $of
    if ($args[1]) { $a1 = '*.'+$args[1]
      if ($args[2]) { $a2 = '*.'+$args[2] }
      if ($args[3]) { $a3 = '*.'+$args[3] }
      "$a1 $a2 $a3" >> $of; "" >> $of
      lwts $a1 $a2 $a3 >> $of
      "results in $of"
    } else { "next three arguments are specific file extensions" }
  } else {
    "first argument should be the general descriptor of the type of files you're looking for"
  } } # examples in  $MSWin10\quickReference.txt

Function lwt-gitignore {
  "vim: nowrap tw=0:" > lwt-gitignore.txt; lwts .gitignore >> lwt-gitignore.txt } # specific case

Function lwts { gci -r -i $args[0],$args[1],$args[2] | %{ dtsFN $_ ':' } | sort }
#  can use wildcards in the <filenames(s)>

#endregion

#endregion
#region --- sizes
Function dc { gci | ForEach-Object { $_.Name + ": " + "{0:N2}" -f ((gci $_ -Recurse | Measure-Object Length -Sum -ErrorAction SilentlyContinue).Sum / 1MB) + " MB" } }

Function fso { $fso = new-object -com Scripting.FileSystemObject; gci -Directory | select @{l='Size'; e={$fso.GetFolder($_.FullName).Size}},FullName | sort Size -Descending | ft @{l='Size [MB]'; e={'{0:N2}    ' -f ($_.Size / 1MB)}},FullName }

#endregion
#region --- strings in files

Function stringInAllFiles { SIFWork string-AllFiles '*' $args[0] }
Function stringInMDs { SIFWork string-md '*.md' $args[0] }
Function stringInPS1s { SIFWork string-ps1 '*.ps1' $args[0] }
Function stringInTexs { $texFiles = '*.cls','*.tex'; SIFWork string-LaTeX $texFiles $args[0] }
Function stringInVims { SIFWork string-vim '*.vim' $args[0] }

Function SIFWork {
  # not to be called directly
  $outFile = $args[0]+".txt"
  "vim: nowrap tw=0:" > $outFile
  "" >> $outFile
  $args[2] >> $outFile
  "" >> $outFile
  gci -r -e $outFile -i $args[1] | ss $args[2] | %{$_.Path+" > "+$_.Line} >> $outFile
  "" >> $outFile
  "vim-easy-align: Sip>" >> $outFile
  ":Tabularize/>" >> $outFile
  $outFile
  }

#endregion
#endregion #region --- general tools

Function e { exit } # quit (doesn't work as an alias)
Function fcco {Format-Custom -InputObject $args[0] -Expand CoreOnly}
# - shows summarised layout of array
Function ffmhb {ffmpeg -hide_banner $args}
Function fn { gci | select -ExpandProperty FullName | sort }
Function gic { git commit -m "$args[0]" }
Function gis { git status -u }
Function gvim { & "C:\Vim\vim82\gvim.exe" $args[0] $args[1] $args[2] }
# New-Alias g gm.exe # GraphicsMagick
New-Alias jpo $onGH\jpgorhor\jpgorhor.ps1

Function l {
  [string[]]$list = (gci).Name
  $list -join '  '
}

#endregion
#region --- Ghostscript

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
#region --- internetworking

Function cc {
  $co = (Invoke-WebRequest http://ifconfig.co/country).Content.replace("`n",'')
  $ci = (Invoke-WebRequest http://ifconfig.co/city).Content.replace("`n",'')
  "$ci, $co"
  }  # city, country
Function ip { (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content }  # IP address
Function p {test-connection -computername 8.8.8.8 -ErrorAction SilentlyContinue}
Function pg {test-connection -computername google.com -ErrorAction SilentlyContinue}
Function wp { curl wttr.in/Paris }

#endregion
#region --- PSFzf

# Set-PsFzfOption -EnableAliasFuzzySetEverything  # cde  does nothing...
# Set-PsFzfOption -EnableAliasFuzzyZLocation  # fz  unfortunately kills  Alt+c...
# and settings for PSReadLine

#endregion
#region --- re-tag image files to 72dpi

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
#region --- shell settings

$env:path +=';C:\Program Files\7-Zip'

$host.privatedata.ErrorForegroundColor = 'gray'
$host.privatedata.ErrorBackgroundColor = 'darkmagenta'

if ($PSVersionTable.PSVersion.Major -eq 7) { Import-Module Powershell.Chunks }

Import-Module posh-git
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Cyan'

Import-Module ps.checkModuleUpdates

#region --- colours in outputs
. $MSWin10\Out-HostColored.ps1
Function SCFCDC { [System.Console]::ForegroundColor = 'DarkCyan' }
Function SCFCW { [System.Console]::ForegroundColor = 'White' }  # SCFCW; "white"; SCRC
Function SCRC { [System.Console]::ResetColor() }
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
# gci | %{ dtsFN $_ ':' } | Format-Color @{'8'='green';'9'='red'}

if ($PSVersionTable.PSVersion.Major -eq 7) {
  $PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::Host;
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
