# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott

Set-Alias ss Select-String

Function GNFR {
  $FRlist = Get-NetFirewallRule | out-string
  $FRlf = "$machine\troin\FirewallRules.txt"
  "vim: set ft=NFR:" > $FRlf
  $FRlist.TrimEnd() >> $FRlf
  '' >> $FRlf
}
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
Function lwp { ls -r `
  | ForEach-Object { $_.LastWriteTime.ToString('yyyyMMdd-HH:mm:ss') + " : " + $_.FullName } `
  | out-string -stream | select-string $args[0] `
  | sort } # <file-path> is a regex

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

Function lwts { gci -r -i $args[0],$args[1],$args[2] `
  | ForEach-Object { $_.LastWriteTime.ToString('yyyyMMdd-HH:mm:ss') + " : " + $_.FullName } `
  | sort } # can use wildcards in the <filenames(s)>

#endregion

#endregion
#region --- sizes
Function dc { Get-ChildItem | ForEach-Object { $_.Name + ": " + "{0:N2}" -f ((Get-ChildItem $_ -Recurse | Measure-Object Length -Sum -ErrorAction SilentlyContinue).Sum / 1MB) + " MB" } }

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
  Get-ChildItem -r -e $outFile -i $args[1] | ss $args[2] | %{$_.Path+" > "+$_.Line} >> $outFile
  "" >> $outFile
  "vim-easy-align: Sip>" >> $outFile
  ":Tabularize/>" >> $outFile
  $outFile
  }

#endregion
#endregion
#region --- general tools

Function e { exit } # quit (doesn't work as an alias)
Function ffmhb {ffmpeg -hide_banner $args}
Function fn { gci | select -ExpandProperty FullName | sort }
Function gic { git commit -m "$args[0]" }
Function gis { git status -u }
Function gvim { & "${Env:ProgramFiles(x86)}\Vim\vim82\gvim.exe" $args[0] $args[1] $args[2] }
Function p {test-connection -computername 8.8.8.8 -ErrorAction SilentlyContinue}
Function pg {test-connection -computername google.com -ErrorAction SilentlyContinue}
# New-Alias g gm.exe # GraphicsMagick
New-Alias jpo $onGH\jpgorhor\jpgorhor.ps1

Function l {
  [string[]]$list = (Get-ChildItem).Name
  $list -join '  '
}

#endregion
#region --- Ghostscript

$env:path +=';C:\Program Files\gs\gs9.54.0\bin'
# Function gsp { 'gswin64c -dSAFER -sDEVICE=png16m -r400 sPageList=$args[0] -o $args[1]%d.png $args[2].pdf' }
Function gsp {
    $PL = $args[0]
    $r = '-r'+$args[1]  # resolution 40 is good for photos
    $pngs = $args[2]+'-%02d.png'
    $pdf = $args[3]+'.pdf'
    $g = "gswin64c -dSAFER -sDEVICE=png16m $r -sPageList=$pl -o $pngs '$pdf'"
    iex $g
    }
#  gsp xx-xx out%d.png 'in.pdf'

#endregion
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
#region --- re-tag image files to 72dpi

# a single image file:
Function im72 {
  $72dpi=$args[0] -replace '((\.[^.]*)$)', '-72dpi$1'
  exiftool -filename=72dpi -xresolution=72 -yresolution=72 $args[0]; mi 72dpi $72dpi -force
  }

# all the files in a folder:
Function all72 {
  Get-ChildItem | Where-Object {-not $_.PsIsContainer} | ForEach-Object { im72 $_
  Remove-Item $_ }
  }

#endregion
#region --- shell settings

$env:path +=';C:\Program Files\7-Zip'

$host.privatedata.ErrorForegroundColor = 'gray'
$host.privatedata.ErrorBackgroundColor = 'darkmagenta'

Import-Module posh-git
$GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Cyan'

if ($PSVersionTable.PSVersion.Major -eq 7) {
  $PSStyle.OutputRendering = [System.Management.Automation.OutputRendering]::Host;
}

Set-PSReadlineOption -EditMode Vi
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

#endregion
