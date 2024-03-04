
# Joseph Harriott
# $MSwin10\symlinks.ps1  to be run in Administator Powershell

# #=> 0 Emacs
# new-item $Env:AppData\.emacs.d\custom.el -itemtype symboliclink -value $onGH\misc\CP\emacs\custom.el -force
# new-item $Env:AppData\.emacs.d\diary -itemtype symboliclink -value $core\TextNotes\Emacs\diary -force
# new-item $Env:AppData\.emacs.d\early-init.el -itemtype symboliclink -value $onGH\misc\CP\emacs\early-init.el -force
# new-item $Env:AppData\.emacs.d\harriott-zenburn-emacs -itemtype symboliclink -value $onGH\harriott-zenburn-emacs -force
# new-item $Env:AppData\.emacs.d\init.el -itemtype symboliclink -value $onGH\misc\CP\emacs\init.el -force
# new-item $Env:AppData\.emacs.d\lisp -itemtype symboliclink -value $onGH\misc\CP\emacs\lisp -force
# # csl $Env:AppData\.emacs.d

# #=> 0 LanguageTool
# # new-item C:\LanguageTool -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\copied\IT-handy\LanguageTool -force
# new-item C:\LanguageTool -itemtype symboliclink -value $ITscc\LanguageTool -force
# java -jar C:\LanguageTool\languagetool-commandline.jar --version

# #=> 0 LaTeX
# new-item $Env:AppData\MiKTeX\tex\latex\jo -itemtype symboliclink -value $CrPl\documenting\LaTeX\jo -force
# #  after changes:  initexmf --update-fndb
# # cSL $Env:AppData\MiKTeX\tex\latex
# #  ii "$Env:AppData\MiKTeX\tex\latex\jo"
# #  sl $Env:AppData\MiKTeX\tex\latex

# #=> 0 Pandoc\defaults
# new-item "$Pandoc\defaults\md4pdfToC.yaml" -itemtype symboliclink -value $MD4PDF\defaults-toc.yaml -force
# new-item "$Pandoc\defaults\md4pdf.yaml" -itemtype symboliclink -value $MD4PDF\defaults.yaml -force

# #=> 0 Pandoc\templates
# $Pt = "$Pandoc\templates"
# if (Test-Path $Pt) {$(get-item $Pt).Delete()}
# new-item "$Pt" -itemtype symboliclink -value $onGH\pandoc-templates -force

#=> 1 $MSwin10
$uname = $Env:USERNAME
  $Drpbx = "C:\Users\$uname\Dropbox"
    $DJH = "$Drpbx\JH"
      $core = "$DJH\core"
        $ITstack = "$core\IT_stack"
          $onGH = "$ITstack\onGitHub"
            $Cn = $Env:Computername
            $MSwin10 = "$onGH\OS-MSWin10"
              $machBld = "$MSWin10\mb-$Cn"

#=> 2 PSProfile
new-item ~\PSProfile.ps1 -itemtype symboliclink -value $MSWin10\PSProfile.ps1 -force

#=> 2 vim
new-item ~\_gvimrc -itemtype symboliclink -value $machBld\user\_gvimrc -force  # $MSWin10/user/_gvimrc
new-item ~\_vimrc -itemtype symboliclink -value $machBld\user\_vimrc -force  # $MSWin10/user/_vimrc
new-item ~\vimfiles -itemtype symboliclink -value $onGH\vimfiles -force

#=> 2 ~\.bashrc
new-item ~\.bashrc -itemtype symboliclink -value $MSWin10\bashrc -force

