
# Joseph Harriott, lun 26 mai 2025

# $MSn/PS/Profile.ps1
#  symlinked in  $MSn/set/2-PSProfile.ps1
#    then called by  $MSn/PS/ProfileStub.ps1

$dts = (Get-Date).ToString("yyMMdd-HHmmss")
sal m mpv
sal seco set-content  # because  sc  is overridden by  sc.exe
sal su C:\SumatraPDF\SumatraPDF.exe
. ~\PSEnv.ps1  # ($MSWin10\mb\neededNodes-1-PSProfile.ps1)

function ep {
  $eps = "$MSWml/path"
  'vim: set nowrap:' > $eps
  '' >> $eps
  $env:path -split ';' >> $eps
  '' >> $eps
  '$env:path  is in  $MSWml/path'
}

function fonts {
  $mf0 = "$MSWml\fonts"
  $mf1 = $mf0+'-1'
  gp -path "registry::\hklm\software\microsoft\windows nt\currentversion\fonts" | fc > $mf1
  (gc $mf1 | select -skip 3) | seco $mf1
  $mf2 = $mf0+'-2'; (gc $mf1 -raw) -replace "(?s)  PSPath.*" > $mf2; ri $mf1
  $mf3 = $mf0+'.wntf'; 'vim: ft=wntf:' > $mf3; '' >> $mf3; (gc $mf2).trim() >> $mf3; ri $mf2
} # $MSWml\fonts.wntf ($vfv/syntax/wntf.vim)

function GNFR {
  $FRlist = Get-NetFirewallRule | out-string
  $FRlf = "$MSWml\FirewallRules.txt"
  "vim: set ft=NFR:" > $FRlf
  $FRlist.TrimEnd() >> $FRlf
  '' >> $FRlf
} # as administrator

function pro {
  Get-Process | sort ws -descending | select-object -first 39 ID,Name,WS,VM,PM,Handles,StartTime | ConvertTo-WPFGrid -Refresh -timeout 10 -Title "Top Processes"
} # needs to be on 3 lines

function wl {
  $dts = (Get-Date).ToString("yyMMdd-HHmmss")
  $mLpwgl = "$MSWml/packages/winget_list-$dts"
  $l0 = $mLpwgl+'0'; winget ls > $l0
  $l1 = $mLpwgl+'1'; (gc $l0 -raw) -replace "(?s).*------" > $l1
  ri $l0
  $lt  = "$mLpwgl.txt"
  'vim: set nowrap: Winget list created by  wl ($MSn/PS/Profile.ps1)' > $lt; '' >> $lt
  gc $l1 | sort | select -skip 2 >> $lt
  sleep 1; ri $l1
  'winget list  is in  $MSWml/packages/winget_list'+"-$dts.txt"
}

function stc {
  '"Nom de la tâche","Prochaine exécution","Statut"' > $MSWml\schtasks.csv
  schtasks /fo csv /nh | sort-object | out-file -append $machlg\schtasks.csv
}
# Alternatively:
#  schtasks /fo list | out-file $machlg\schtasks.txt -encoding utf8bom
#   ri $machlg\schtasks.txt

# Pansies coloured line
function GGrb { Get-Gradient red blue -Flatten | %{Write-Host " " -BackgroundColor $_ -NoNewline} }

#=> 0 convert images recursively
function mc {
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
function lc { [string[]]$list = (gci).Name; $list -join '  ' }
function ~ { sl ~ }

# nvim/vim, quitting to last file's directory ($vfv/enter/vimrc.vim)
function n { nvim $args; gc $home/lastVimDirectory | sl }
function v { C:\Vim\vim91\vim.exe $args; gc $home/lastVimDirectory | sl }

sal l lsd
  function la { l -a } # --all
  function lg { l -glR } # --git stqtus
  function ll { l -l } # --long
  function lls { l -lS --reverse } # --sizesort
  function llt { l -lt --reverse } # --timesort
  function lt { l --tree }
  function ltd { l -d --tree } # -directory-only
  function lx { l -lRX } # --recursive --extensionsort
sal vf vifm

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
      $af; (get-content $af) -replace $args[0], $args[1] | seco $af
    }
  } # (release files for: change contents)  chco '\$m' '$mmm'

function endi { if ( ! ( test-path $args[0] ) ) { md $args[0] } } # ensure directory
function syli { ni $args[1] -type symboliclink -value $args[0] -force } # symbolic link

# tidy tex = clear away TeX ancillary files
function tit { ri "*.aux"; ri "*.log"; ri "*.out"; ri "*.toc" }

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
function dtsfn { $args[0].lastwritetime.ToString('yyyyMMdd-HH:mm:ss')+' '+$args[1]+' '+ $args[0].fullname } # - used by other functions  ls <test> | %{ dtsfn $_ ':' }

function encrypted {
  $encrypted = "actions", "digital0", "digital1", "secure0", "secure1", "shg", "stack"
  if (!($(gl).path).equals($enc)) {
    if ( ( test-path $enc ) ) { sl $enc } else { "$enc ain't there"; return } }
  foreach ($node in $encrypted) {
    ''; scfcdc; $node; scrc
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

function lwp { gci -r | %{ dtsfn $_ ':' } | out-string -stream | sls $args[0] | sort }
#  $args[0]  is a regex, something in the filepath

#====> by name
function lwt {
  if ($args[0]) {
    $of = 'lwt-'+$args[0]+'.ffl'; "" > $of
    if ( $args[0] -eq 'gitignore' ) {
      'gitignore' >> $of; '' >> $of
      fd -tf -u -E .git gitignore | %{ ls $_ } | %{ dtsfn $_ ':' } | sort >> $of; "results in $of"
    } else {
      if ($args[1]) {
        $args[1]+' '+$args[2]+' '+$args[3] >> $of; '' >> $of
        $fdfEe = "fd -tf -E copied-code -E copied-reference -e " + $args[1]
        if ($args[2]) { $fdfEe = $fdfEe + ' -e ' + $args[2] }
        if ($args[3]) { $fdfEe = $fdfEe + ' -e ' + $args[3] }
        iex $fdfEe | %{ ls $_ } | %{ dtsfn $_ ':' } | sort >> $of
        "results in $of"
      } else { "next three arguments are specific file extensions" } }
  } else {
    "first argument should be the general descriptor of the type of files you're looking for"
  } } # examples in  $MSWin10/QR/CLI-encoding-PowerShell.md

#===> sizes
function dc { gci | foreach-object { $_.name + ": " + "{0:n2}" -f ((gci $_ -recurse | measure-object length -sum -erroraction silentlycontinue).sum / 1mb) + " mb" } }

function du { du64 -nobanner -l 1 }

function fso { $fso = new-object -com scripting.filesystemobject; gci -directory | select @{l='size'; e={$fso.getfolder($_.fullname).size}},fullname | sort size -descending | ft @{l='size [mb]'; e={'{0:n2}    ' -f ($_.size / 1mb)}},fullname }

function gfsi { Get-ChildItem . -Directory | Get-FolderSizeInfo -Hidden | Sort-Object TotalSize -Descending | Format-Table -AutoSize -View mb }

#===> string in files

function nvdg { $outfile = "$DJH/search/nvdg.sifl"
  sifw0 $outfile 'neovim.discourse.group'
  foreach($ITd in $jtIT, $coreIT) { "Searching in $ITd\..."
    rg -tmd neovim.discourse.group $ITd >> $outfile; '' >> $outfile}
  sleep 4; ((gc $outfile) -join "`n") + "`n" | seco -NoNewline $outfile  # CRLF -> LF
  sl "$DJH/search" }

function removeMatchingLines {
  $a0 = $args[0]; $a1 = $args[1]
  seco $a0 -value (gc $a0 | sls -pattern $a1 -notmatch)
} # (gcm removeMatchingLines).scriptblock

function SE { $outfile = "$DJH/search/SEN.sifl"
  sifw0 $outfile 'stackexchange|stackoverflow|superuser'
  foreach($ITd in $coreIT, "$JHw\France", $jtIT) { "Searching in $ITd\..."; sl $ITd
    gci -r -e $outfile -i '*.md' | sls 'stackexchange|stackoverflow|superuser' | %{
      $_.path+" > "+$_.line} >> $outfile; '' >> $outfile }
  sleep 4; removeMatchingLines $outfile 'README.md'
  sleep 4; removeMatchingLines $outfile 'vimfiles\\vim\\'
  sifw1 $outfile
  sl "$DJH/search" }

function sifw0 {
  "" > $args[0]
  '  vim search in here for  '+$args[1].replace('|','\|') >> $args[0]
  "" >> $args[0]
} # header
function sifw1 {
  "vim-easy-align: gAip>" >> $outfile
  ":packadd tabular | Tabularize/>" >> $outfile
  '' >> $outfile
  $outfile
} # footer

#====> github issues
# $jtIT\ghissues.sifl
# $coreIT\ghissues.sifl
function ghissues { rgw md 'github\.com.+issues' }

#====> ripgrep
function rgo { rg --field-match-separator ':::' $args } # rgo -tps '^}' $MSWin10 > "$MSWin10/}.rgo"

function rgw {
  $rgw = 'rg-'+$args[0]+'.sifl'
  $rgot = "~/rgo-temp"
  sifw0 $rgw $args[1]  # helpful header
  $rgs = 'rg -t'+$args[0]+' '+$args[1] # rg search
  $rgoa = (iex $rgs) # rg output array
  foreach ($rgf in $rgoa) {
    $rgfp = $rgf -replace ':.*',''  # rg find path
    $rgfpl = $rgfp.replace('\','/') # rgf linux style
    $rgfc = $rgf -replace '(.*?):(.*)', '$2'  # rg find contents
    $rgfpl+' > '+$rgfc >> $rgw  # tidied up
  }
  "" >> $rgw
  sifw1 $outfile
  sleep 2; ((gc $rgw) -join "`n") + "`n" | seco -NoNewline $rgw  # CRLF -> LF
  "- output is in  $rgw"
} # ripgrep for Windows: rgw <rg_file_group> <unquoted_regex>, eg  rgw tex geometry

#=> 0 Ghostscript
function gsp {
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
      SCFCW; $g; SCRC
      iex "$g"
    } else { "$pdf ain't there" }
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
function im72 {
  $72dpi=$args[0] -replace '((\.[^.]*)$)', '-72dpi$1'
  exiftool -filename=72dpi -xresolution=72 -yresolution=72 $args[0]; mi 72dpi $72dpi -force
  }

# all the files in a folder:
function all72 {
  gci | Where-Object {-not $_.PsIsContainer} | ForEach-Object { im72 $_
  Remove-Item $_ }
  }

#=> 0 internetworking
function cico {
  $co = (iwr http://ifconfig.co/country).Content.replace("`n",'')
  $ci = (iwr http://ifconfig.co/city).Content.replace("`n",'')
  if ( $ci ) { "$ci, $co" } else { "$co" }
  }  # [city, ]country
function ip { (iwr "http://ifconfig.me/ip").Content }  # IPv6
function lanip { ipconfig | where {$_ -match 'IPv4.+\s(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' } | out-null; $Matches[1] }
function tc {test-connection 8.8.8.8 -ErrorAction SilentlyContinue}
function tcg {test-connection google.com -ErrorAction SilentlyContinue}
function wp { curl wttr.in/Paris }

#==> yt-dlp
# sal y yt-dlp
sal y $HADL\Microsoft\WinGet\Packages\yt-dlp.yt-dlp_Microsoft.Winget.Source_8wekyb3d8bbwe\yt-dlp.exe
  function y7 { y -f '[height<=?720]' $args[0] }
  function yf { y -F $args[0] }

#=> 0 shell settings
$env:TERM = "xterm-256color"  # $vfn/lua/init.lua

# Backup command history:
cp (Get-PSReadlineOption).HistorySavePath $MSWml/CHh/$dts.ps1  # $coreIT/MSWin

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
if ( where.exe git 2>$null ) {
  # 1 posh-git
  ipmo posh-git
  $GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::cyan
  $GitPromptSettings.WindowTitle = $null  # (undocumented) disables  $GitPromptSettings.WindowTitle
  # 2 togglable prompt
  function pp {
    if ($shortPrompt) {
      function global:prompt {
        $Host.UI.RawUI.WindowTitle = "$(split-path (split-path $pwd) -leaf)\$(split-path $pwd -leaf)"
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
      function global:prompt {
        $Host.UI.RawUI.WindowTitle = "$(split-path (split-path $pwd) -leaf)\$(split-path $pwd -leaf)"
        write-host ( $ps_context + $(split-path $pwd -leaf) + '>') -nonewline -ForegroundColor cyan
        return " "
      }
      $global:shortPrompt = $true
    }
  }
  $global:shortPrompt = $true; pp  # invokes my long prompt
} else {
  function global:prompt {
    # when  Git  not yet there
    write-host ( $ps_context + $(Get-Location) + $(if ($NestedPromptLevel -ge 1) { '>>' }) + '> ' ) -NoNewline -ForegroundColor cyan
    return " "
  }
}

#==> PSReadLine
Set-PSReadlineOption -EditMode Vi  # wipes out any other settings, so first

Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# PSFzf additions
if ( ( test-path "$HADL\Microsoft\WinGet\Links\fzf.exe" ) -or ( test-path "$HADL\Microsoft\WinGet\Packages\junegunn.fzf_Microsoft.Winget.Source_8wekyb3d8bbwe\fzf.exe" ) ) {
  Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
  Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
}

#=> 1 place-dependent
if ( test-path $ITscc )
  { . $ITscc/CP/wfxr-code-minimap/completions/powershell/_code-minimap.ps1 }

#==> documenting
function xc { iex "su $ITscr\CP\TeX\LaTeX\appearance\colour\xcolor.pdf -page 38" }

#===> MiKTeX
function x { xelatex -halt-on-error --max-print-line=110 $args[1] $args[0] }

function lj {
  Remove-Item -recurse $tex\latex\jo
  Copy-Item -recurse $coreIT\CrossPlatform\forLaTeX $tex\latex\jo
} # instead of a symlink to avoid snags if MiKTeX is uninstalled

#===> Pandoc
function headings0sty { cpi $MD4PDF/iih/headings0.sty $tex\latex\m4p\headings.sty -force }
# - will need a  miktex fndb refresh  after first run
function m4p { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4p.ps1 $args[0] $args[1] $args[2] $args[3] }
function m4ps0 { headings0sty; PowerShell -NoProfile $MD4PDF\MSWin\m4ps.ps1 $args[0] $args[1] $args[2] } # m4ps0 [-n] [-r] [-s]
function mt { sl $Drpbx\JH\core\TextNotes; [string]$Pwd; m4ps0 -s }

#==> Dropbox conflicted copies
$dcc = ''

function dcc0 {
  sl $Drpbx
  $dts = (Get-Date).ToString("yyMMdd-HHmmss")
  Set-Variable -scope 1 -Name 'dcc' -Value "$Drpbx\conflicted\$dts.dcc"
  '' > $dcc
  "scanning for conflicted copies in $Drpbx"
  $all = gci -r | ? Name -match ".+'s conflicted copy .+| \(Copie en conflit de " | %{echo $_.fullname}
  $new = $all | ? { $_ -notmatch '.*\\Dropbox\\conflicted' }
  $new >> $dcc
  gvim $dcc
}  # lists them, using  $vfv/syntax/dcc.vim

function dcc1 {
  if ( test-path $dcc ) {
    $dccRemoved=$dcc.Replace('.dcc','-removed')
    new-item $dccRemoved -type directory > $null
    $dccRestore = "$dccRemoved-restore.ps1"
    '# vim: nowrap:' > $dccRestore
    '' >> $dccRestore
    gc $dcc | select-object -skip 1 | %{
      $removedRelativePath=$_.Replace("$Drpbx\",'')
      $removedFlattenedPath = $removedRelativePath.Replace('\','--')
      $removedFPNS = $removedFlattenedPath.Replace(' ','_')
      mi "$_" "$dccRemoved\$removedFPNS"
      "cpi `"$dccRemoved\$removedFPNS`" `"$_`"" >> $dccRestore
    }
    ri $dcc
    gvim $dccRestore -c "silent! /[^\\]\+\ze (Copie\|sbMb"
  } else { "- you should've dcc0'd" | Out-HostColored dcc0 }
}  # removes them

#==> FFmpeg
function ffa { $f = $args -join ' '
  $f = $f.Replace(' -c: a ', ' -c:a ')
  $f = $f.Replace(' -q: v ', ' -q:v ')
  iex "$f" } # no spaces or () in file names
function ffi { $f = "ffa ffmpeg -hide_banner -i " + $args; iex $f }

#==> general tools
function xx { exit } # quit (doesn't work as an alias) ctrl+d is quicker
function fcco {Format-Custom -InputObject $args[0] -Expand CoreOnly}
# - shows summarised layout of array
function fn { gci | select -ExpandProperty FullName | sort }
function gvim { & "C:\Vim\vim91\gvim.exe" $args[0] $args[1] $args[2] }
function tz { Get-MyTimeInfo -Locations ([ordered]@{"GMT" = "GMT Standard Time"}) -HomeTimeZone "Romance Standard Time" }
# New-Alias g gm.exe # GraphicsMagick
New-Alias jpo $onGH\jpgorhor\jpgorhor.ps1

#==> Git
function ga { git add $args[0] }
function gic { git commit -m "$args[0]" }
function gsbs { git status -bs } # --branch --short
function gsu { git status -u } # --untracked-files=all
function il { sl $Drpbx; fd -tf -u index.lock | %{ri $_} }

#==> Jekyll
function js { sl $JHm; $JHm; bundle exec jekyll serve --drafts; }
function jt { sl $JHm; ri tag\*; python $JHm\_plugins\compile_tags.py; sl tag; }

#==> PSFzf
# Set-PsFzfOption -EnableAliasFuzzySetEverything  # cde  does nothing...
# Set-PsFzfOption -EnableAliasFuzzyZLocation  # fz  unfortunately kills  Alt+c...
# and settings for PSReadLine

# see  $MSWin10\QR\cli.md

#==> sharkdp/bat
# completion
function f { Invoke-Fzf -preview 'bat --color=always {}' }
sal b bat
function bd { bat -d $args[0] }  # showing changes from git index

#==> shell - colours in outputs
. $MSn\PS\Out-HostColored.ps1
function SCFCDC { [System.Console]::ForegroundColor = 'DarkCyan' }
#  scfcdc; "DarkCyan"; scrc; 'normal'
function SCFCW { [System.Console]::ForegroundColor = 'White' }  # scfcw; "White"; scrc
function SCRC { [System.Console]::ResetColor() }
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

#=> 2 zoxide
iex (& { (zoxide init powershell | Out-String) })
sal j z  # zoxide

