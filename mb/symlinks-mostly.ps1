
# Joseph Harriott - https://harriott.github.io/

# once  $Env:Computername,  APS> . $MSwin10\mb\symlinks.ps1

#=> Emacs
$Ed = "$Env:AppData\.emacs.d"; if ( ! ( test-path "$Ed" ) ) { ni -path "$Ed" -type directory }
ni $Ed\custom.el -type symboliclink -value $misc\CP\emacs\custom.el -force
ni $Ed\diary -type symboliclink -value $core\TextNotes\Emacs\diary -force
ni $Ed\early-init.el -type symboliclink -value $misc\CP\emacs\early-init.el -force
ni $Ed\harriott-zenburn-emacs -type symboliclink -value $onGH\harriott-zenburn-emacs -force
ni $Ed\init.el -type symboliclink -value $misc\CP\emacs\init.el -force
ni $Ed\lisp -type symboliclink -value $misc\CP\emacs\lisp -force

#=> ~\.gitconfig
ni ~\.gitconfig -type symboliclink -value $machBld\gitconfig -force

#=> gokcehan lf configuration
ni ~\AppData\Local\lf\colors -type symboliclink -value $MSWin10\lf\colors -force
ni ~\AppData\Local\lf\lfrc -type symboliclink -value $MSWin10\lf\lfrc -force
ni ~\AppData\Local\lf\icons -type symboliclink -value $MSWin10\lf\icons -force

#=> LaTeX
ni $Env:AppData\MiKTeX\tex\latex\jo -type symboliclink -value $CrPl\documenting\LaTeX\jo -force
#  after changes:  initexmf --update-fndb
#  ii "$Env:AppData\MiKTeX\tex\latex\jo"
#  sl $Env:AppData\MiKTeX\tex\latex

#=> Pandoc\defaults
$Pd = "$Pandoc\defaults"; if ( ! ( test-path "$Pd" ) ) { ni -path "$Pd" -type directory }
ni "$Pd\md4pdfToC.yaml" -type symboliclink -value $MD4PDF\defaults-toc.yaml -force
ni "$Pd\md4pdf.yaml" -type symboliclink -value $MD4PDF\defaults.yaml -force

#=> Pandoc\templates
$Pt = "$Pandoc\templates"
if (test-path $Pt) {$(get-item $Pt).Delete()}
ni "$Pt" -type symboliclink -value $onGH\pandoc-templates -force

#=> PSProfile
cpi $MSWin10\MPSProfile.ps1 ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
$DWP = "~\Documents\WindowsPowerShell"
if ( ! ( test-path "$DWP" ) ) { ni -path "$DWP" -type directory }
cpi $MSWin10\MPSProfile.ps1 ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
ni ~\Env.ps1 -type symboliclink -value $MSWin10\Env.ps1 -force
ni ~\PSProfile.ps1 -type symboliclink -value $MSWin10\PSProfile.ps1 -force

#=> vim flavours
cp $ITscc\forMSWin\code-minimap\code-minimap-v0.6.7-x86_64-pc-windows-msvc\code-minimap.exe ~\AppData\Local\Microsoft\WindowsApps\code-minimap.exe

ni ~\AppData\Local\nvim -type symboliclink -value $MSWin10\nvim -force

ni ~\_gvimrc -type symboliclink -value $machBld/_gvimrc -force
ni ~\_vimrc -type symboliclink -value $MSWin10/mb/_vimrc-AZERTY -force
ni ~\vimfiles -type symboliclink -value $vimfiles\vimfiles -force
  ni ~\vimfiles\pack -type symboliclink -value $vimfiles\pack -force
  ni ~\vimfiles\plugin -type symboliclink -value $vimfiles\plugin -force
  # ni ~\vimfiles\vimenter -type symboliclink -value $vimfiles\vimenter -force
  ni ~\vimfiles\vimrc-Win10-paths.vim -type symboliclink -value $vimfiles\vimenter\vimrc-Win10-paths.vim -force
ni ~\_vimtest -type symboliclink -value $misc\CP\vimtest -force

#=> ~\.bashrc
ni ~\.bashrc -type symboliclink -value $MSWin10\bashrc -force

