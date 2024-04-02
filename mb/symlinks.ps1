# vim: se fdl=1:

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
ni ~\Env.ps1 -type symboliclink -value $MSWin10\Env.ps1 -force
ni ~\PSProfile.ps1 -type symboliclink -value $MSWin10\PSProfile.ps1 -force

#=> vim
ni ~\_gvimrc -type symboliclink -value $machBld/_gvimrc -force
ni ~\_vimrc -type symboliclink -value $MSWin10/mb/HPEB840G3-user/_vimrc -force
ni ~\vimfiles -type symboliclink -value $onGH\vimfiles -force

#=> ~\.bashrc
ni ~\.bashrc -type symboliclink -value $MSWin10\bashrc -force

