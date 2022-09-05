
#  #region  &  #endregion  create folding blocks if Peter Provost's  vim-ps1  is installed

# Joseph Harriott
# to be run in Administator Powershell

#region --- Emacs
new-item $Env:AppData\.emacs.d -itemtype symboliclink -value $emd -force
new-item $Env:AppData\.emacs -itemtype symboliclink -value $MSwin10\user\_emacs -force
# csl $Env:AppData

#endregion
#region --- LanguageTool
# new-item C:\LanguageTool -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\copied\IT-handy\LanguageTool -force
new-item C:\LanguageTool -itemtype symboliclink -value $cITh\CP\LanguageTool -force
java -jar C:\LanguageTool\languagetool-commandline.jar -h

#endregion
#region --- LaTeX
new-item $Env:AppData\MiKTeX\tex\latex\jo -itemtype symboliclink -value $CrPl\LaTeX\jo -force
# cSL $Env:AppData\MiKTeX\tex\latex

#endregion
#region --- Pandoc\defaults

new-item "$Pandoc\defaults\md4pdfToC.yaml" -itemtype symboliclink -value $MD4PDF\defaults-toc.yaml -force
new-item "$Pandoc\defaults\md4pdf.yaml" -itemtype symboliclink -value $MD4PDF\defaults.yaml -force

#endregion
#region --- Pandoc\templates

$Pt = "$Pandoc\templates"
if (Test-Path $Pt) {$(get-item $Pt).Delete()}
new-item "$Pt" -itemtype symboliclink -value $onGH/pandoc-templates -force

#endregion
#region --- PSProfile
new-item ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -itemtype symboliclink -value $MSWin10\PSProfile.ps1 -force
new-item ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -itemtype symboliclink -value $MSWin10\PSProfile.ps1 -force

#endregion
#region --- vim

# new-item $HOME\_gvimrc -itemtype symboliclink -value $MSWin\user\_gvimrc -force
new-item ~\_gvimrc -itemtype symboliclink -value $MSWin10\user\_gvimrc -force  # $MSWin10/user/_gvimrc
# remove-item $HOME\vimfiles -recurse -force
# new-item $HOME\vimfiles -itemtype symboliclink -value $onGH\vimfiles -force
new-item ~\vimfiles -itemtype symboliclink -value $onGH\vimfiles -force

#endregion
#region --- ~\.bashrc

# new-item $HOME\.bashrc -itemtype symboliclink -value $MSWin\user\bashrc -force
new-item ~/.bashrc -itemtype symboliclink -value $MSWin10/user/bashrc -force

#endregion
#region --- ~\.ssh\config

# new-item $HOME\.ssh\config -itemtype symboliclink -value $ITstack\CrossPlatform\SSHconfig\LIP120s81A4 -force
# new-item $HOME\.ssh\config -itemtype symboliclink -value $machine\jnbh\SSHconfig -force

#endregion
