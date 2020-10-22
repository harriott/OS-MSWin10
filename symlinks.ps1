# vim: set et tw=0:
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott
# to be run in Administator Powershell

#region --- MiKTeX

new-item "$MiKTeX\latex\jo" -itemtype symboliclink -value $ITstack\CrossPlatform\forLaTeX

#endregion
#region --- Pandoc\defaults

new-item "$Pandoc\defaults\md4pdfToC.yaml" -itemtype symboliclink -value $MD4PDF\defaults-toc.yaml -force
new-item "$Pandoc\defaults\md4pdf.yaml" -itemtype symboliclink -value $MD4PDF\defaults.yaml -force

#endregion
#region --- Pandoc\templates

$(get-item $Pandoc\templates).Delete()
new-item "$Pandoc\templates" -itemtype symboliclink -value $onGH/pandoc-templates -force

#endregion
#region --- vim

# new-item $HOME\_gvimrc -itemtype symboliclink -value $MSWin\user\_gvimrc -force
# remove-item $HOME\vimfiles -recurse -force
# new-item $HOME\vimfiles -itemtype symboliclink -value $ITstack\vimfiles -force

#endregion
#region --- ~\.bashrc

# new-item $HOME\.bashrc -itemtype symboliclink -value $MSWin\user\bashrc -force

#endregion
#region --- ~\.ssh\config

# new-item $HOME\.ssh\config -itemtype symboliclink -value $machine\jnbh\SSHconfig -force

#endregion
