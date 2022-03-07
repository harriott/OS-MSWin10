
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott
# to be run in Administator Powershell:  iex $MSWin10\symlinks.ps1

#region --- LanguageTool
new-item C:\LanguageTool -itemtype symboliclink -value C:\Users\troin\Dropbox\JH\copied\IT-handy\LanguageTool -force

#endregion
#region --- LaTeX
new-item $Env:AppData\MiKTeX\tex\latex\jo -itemtype symboliclink -value $ITstack\CrossPlatform\LaTeX\jo -force

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
#region --- vim

# new-item $HOME\_gvimrc -itemtype symboliclink -value $MSWin\user\_gvimrc -force
# remove-item $HOME\vimfiles -recurse -force
# new-item $HOME\vimfiles -itemtype symboliclink -value $onGH\vimfiles -force

#endregion
#region --- ~\.bashrc

# new-item $HOME\.bashrc -itemtype symboliclink -value $MSWin\user\bashrc -force

#endregion
#region --- ~\.ssh\config

# new-item $HOME\.ssh\config -itemtype symboliclink -value $ITstack\CrossPlatform\SSHconfig\LIP120s81A4 -force
# new-item $HOME\.ssh\config -itemtype symboliclink -value $machine\jnbh\SSHconfig -force

#endregion
