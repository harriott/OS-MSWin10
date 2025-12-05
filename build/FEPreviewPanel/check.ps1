
# Joseph Harriott, lun 01 déc 2025

# & $MSWin10/build/FEPreviewPane/check.ps1

# for File Explorer Preview Pane

function chdPT { $k = "Registry::HKEY_CLASSES_ROOT\.$e"
  if (Test-Path $k) {
    $RHd = (gp $k).'(default)'; $RHPT = (gp $k).'PerceivedType'
    $f+": $RHd : $RHPT" } else { $f+": -" } }
  # check  (default), PerceivedType

#=> AutoHotkey
$f = 'AutoHotkey'; $e = "ahk"; chdPT

#=> DokuWiki
$f = 'DokuWiki'; $e = "dw"; chdPT

#=> Emacs Lisp
$f = 'Emacs Lisp'; $e = "el"; chdPT

#=> LaTeX auxiliary file
$f = 'LaTeX auxiliary file'; $e = "aux"; chdPT

#=> LaTeX style file
$f = 'LaTeX style file'; $e = "sty"; chdPT

#=> log
$f = 'log'; $e = "log"; chdPT

#=> md
$f = 'md'; $e = "md"; chdPT

#=> my draft emails file
$f = 'my draft emails file'; $e = "emdr"; chdPT

#=> PowerShell script
$f = 'PowerShell script'; $e = "ps1"; chdPT

#=> TeX source file
$f = 'TeX source file'; $e = "sty"; chdPT

#=> vimscript
$f = 'vimscript'; $e = "vim"; chdPT

