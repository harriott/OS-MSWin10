
# Joseph Harriott - https://harriott.github.io/

# APS> . $MSwin10\mb\symlinks.ps1

# #=> 0 Emacs
# ni $Env:AppData\.emacs.d\custom.el -type symboliclink -value $onGH\misc\CP\emacs\custom.el -force
# ni $Env:AppData\.emacs.d\diary -type symboliclink -value $core\TextNotes\Emacs\diary -force
# ni $Env:AppData\.emacs.d\early-init.el -type symboliclink -value $onGH\misc\CP\emacs\early-init.el -force
# ni $Env:AppData\.emacs.d\harriott-zenburn-emacs -type symboliclink -value $onGH\harriott-zenburn-emacs -force
# ni $Env:AppData\.emacs.d\init.el -type symboliclink -value $onGH\misc\CP\emacs\init.el -force
# ni $Env:AppData\.emacs.d\lisp -type symboliclink -value $onGH\misc\CP\emacs\lisp -force
# # csl $Env:AppData\.emacs.d

# #=> 0 LanguageTool
# # ni C:\LanguageTool -type symboliclink -value C:\Users\troin\Dropbox\JH\copied\IT-handy\LanguageTool -force
# ni C:\LanguageTool -type symboliclink -value $ITscc\LanguageTool -force
# java -jar C:\LanguageTool\languagetool-commandline.jar --version

# #=> 0 LaTeX
# ni $Env:AppData\MiKTeX\tex\latex\jo -type symboliclink -value $CrPl\documenting\LaTeX\jo -force
# #  after changes:  initexmf --update-fndb
# # cSL $Env:AppData\MiKTeX\tex\latex
# #  ii "$Env:AppData\MiKTeX\tex\latex\jo"
# #  sl $Env:AppData\MiKTeX\tex\latex

# #=> 0 Pandoc\defaults
# md $Pandoc\defaults
# ni "$Pandoc\defaults\md4pdfToC.yaml" -type symboliclink -value $MD4PDF\defaults-toc.yaml -force
# ni "$Pandoc\defaults\md4pdf.yaml" -type symboliclink -value $MD4PDF\defaults.yaml -force
# # csl $Pandoc\defaults

#=> 0 Pandoc\templates
$Pt = "$Pandoc\templates"
if (Test-Path $Pt) {$(get-item $Pt).Delete()}
ni "$Pt" -type symboliclink -value $onGH\pandoc-templates -force
csl $Pandoc\templates

# #=> 1 $MSwin10
# $uname = $Env:USERNAME
#   $Drpbx = "C:\Users\$uname\Dropbox"
#     $DJH = "$Drpbx\JH"
#       $core = "$DJH\core"
#         $ITstack = "$core\IT_stack"
#           $onGH = "$ITstack\onGitHub"
#             $Cn = $Env:Computername
#             $MSwin10 = "$onGH\OS-MSWin10"
#               $machBld = "$MSWin10\mb-$Cn"

# #=> 2 PSProfile
# ni ~\PSProfile.ps1 -type symboliclink -value $MSWin10\PSProfile.ps1 -force

# #=> 2 vim
# ni ~\_gvimrc -type symboliclink -value $machBld\user\_gvimrc -force  # $MSWin10/user/_gvimrc
# ni ~\_vimrc -type symboliclink -value $machBld\user\_vimrc -force  # $MSWin10/user/_vimrc
# ni ~\vimfiles -type symboliclink -value $onGH\vimfiles -force
#  # csl ~

# #=> 2 ~\.bashrc
# ni ~\.bashrc -type symboliclink -value $MSWin10\bashrc -force
# csl ~

