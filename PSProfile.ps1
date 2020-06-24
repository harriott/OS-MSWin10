# vim: set et tw=0:
# #region & #noregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott

#region - Folder investigations:

Function cex { gci . -r | where { ! $_.PSIsContainer } | Group Extension -noElement | Sort Count -Desc }

Function dc { Get-ChildItem | ForEach-Object { $_.Name + ": " + "{0:N2}" -f ((Get-ChildItem $_ -Recurse | Measure-Object Length -Sum -ErrorAction SilentlyContinue).Sum / 1MB) + " MB" } }

Function gfiln { gci -r $args[0] | select -ExpandProperty FullName }
Function gfoln { gci -r $args[0] | where { $_.PSIsContainer } | select -ExpandProperty FullName }
#
# "last write time" sort (can accept a filename, including wildcards):
Function lwt { gci -r -i $args[0],$args[1] | ForEach-Object { $_.LastWriteTime.ToString('yyyyMMdd-HH:mm:ss') + " : " + $_.FullName } | sort }
# "last write path" sort (accepts a part of a file-path as argument):
Function lwp { ls -r | ForEach-Object { $_.LastWriteTime.ToString('yyyyMMdd-HH:mm:ss') + " : " + $_.FullName } | out-string -stream | select-string $args[0] | sort }

Function lwt-docs      { "vim: nowrap tw=0:" > lwt-docs.txt; lwt *.doc *.odt >> lwt-docs.txt }
Function lwt-gitignore { "vim: nowrap tw=0:" > lwt-gitignore.txt; lwt .gitignore >> lwt-gitignore.txt }
Function lwt-sh        { "vim: nowrap tw=0:" > lwt-sh.txt; lwt *.sh >> lwt-sh.txt }
Function lwt-tex       { "vim: nowrap tw=0:" > lwt-tex.txt; lwt *.tex >> lwt-tex.txt }

Import-Module ZLocation

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

#region - strings in files

Function stringInFiles { SIFWork Files-searchString '*' $args[0] }
Function stringInTexs { $texFiles = '*.cls','*.tex'; SIFWork LaTeX-searchString $texFiles $args[0] }
Function stringInVims { SIFWork Vims-searchString '*.vim' $args[0] }

Function SIFWork {
  # not to be called directly
  $outFile = $args[0]+".txt"
  "vim: nowrap tw=0:" > $outFile
  "" >> $outFile
  $args[2] >> $outFile
  "" >> $outFile
  Get-ChildItem -r -e $outFile -i $args[1] | select-string $args[2] | %{$_.Path+" > "+$_.Line} >> $outFile
  "" >> $outFile
  "vim-easy-align: Sip>" >> $outFile
  ":Tabularize/>" >> $outFile
  }

#endregion

#endregion

#region - General tools:

Function e { exit } # quit
Function gis { git status -u }
Function p {test-connection -computername 8.8.8.8 -ErrorAction SilentlyContinue}
# New-Alias g gm.exe # GraphicsMagick
New-Alias jpo $onGH\jpgorhor\jpgorhor.ps1
New-Alias m4p $onGH\md4pdf\MSWin\m4p.ps1
New-Alias m4ps $onGH\md4pdf\MSWin\m4ps.ps1
New-Alias RbS0 $onGH\SyncPortableDrives\RoboHPP-Sync0.ps1
New-Alias RbS1 $onGH\SyncPortableDrives\RoboHPP-Sync1.ps1
New-Alias RbSh $onGH\SyncPortableDrives\RoboSM3_Share.ps1
New-Alias RbSm $onGH\SyncPortableDrives\RoboSmall.ps1

#endregion

#region - Re-tag image files to 72dpi:
# a single image file:
Function im72 { $72dpi=$args[0] -replace '((\.[^.]*)$)', '-72dpi$1'; exiftool -filename=72dpi -xresolution=72 -yresolution=72 $args[0]; mi 72dpi $72dpi -force }

# all the files in a folder:
Function all72 { Get-ChildItem | Where-Object {-not $_.PsIsContainer} | ForEach-Object { im72 $_; Remove-Item $_ } }

#endregion

#region - Shell settings:
$env:path +=';C:\Program Files\7-Zip'

$host.privatedata.ErrorForegroundColor = 'darkgray'
$host.privatedata.ErrorBackgroundColor = 'darkmagenta'

Import-Module posh-git

Set-PSReadlineOption -EditMode Vi
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

#endregion

