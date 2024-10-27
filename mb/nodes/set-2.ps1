
# Joseph Harriott - https://harriottgithubio/ - mer 11 sept 2024

# once  $Cn,  APS> . $MSWin10\mb\nodes\set-2.ps1

# endi & syli  defined in  $MSWin10\PSProfile.ps1

# #=> Emacs
# $Ed = "$HADR\.emacs.d"; endi $Ed
# syli $misc\CP\emacs\custom.el $Ed\custom.el
# syli $core\TextNotes\Emacs\diary $Ed\diary
# syli $misc\CP\emacs\early-init.el $Ed\early-init.el
# syli $onGH\harriott-zenburn-emacs $Ed\harriott-zenburn-emacs
# syli $misc\CP\emacs\init.el $Ed\init.el
# syli $misc\CP\emacs\lisp $Ed\lisp

# #=> gokcehan lf configuration
# syli $MSWin10\lf\colors $HADL\lf\colors
# syli $MSWin10\lf\lfrc $HADL\lf\lfrc
# syli $MSWin10\lf\icons $HADL\lf\icons

# #=> MiKTeX
# syli $CrPl\documenting\LaTeX\jo $tex\latex\jo  # csl $tex\latex
# #  after changes:  miktex fndb refresh
# #  ii "$tex\latex\jo"
# #  sl $tex\latex

# #=> Mozilla Thunderbird safely
# syli $MSwin10\Thb\runSafely.ps1 C:\MT-runSafely.ps1
# #  csl C:\MT-runSafely.ps1
# syli $MSwin10\Thb\clearParentLock.ps1 C:\MT-clearParentLock.ps1
# #  csl C:\MT-clearParentLock.ps1

# #=> Node.js
# md $HADR\npm

# #=> Pandoc m4p
# md $tex\latex\m4p

# #=> Pandoc\defaults
# $Pd = "$Pandoc\defaults"; endi $Pd
# syli $MD4PDF\defaults-toc.yaml "$Pd\md4pdfToC.yaml"
# syli $MD4PDF\defaults.yaml "$Pd\md4pdf.yaml"

# #=> Pandoc\templates
# $Pt = "$Pandoc\templates"; endi $Pt
# syli $onGH\pandoc-templates "$Pt"

# #=> Ruby
# cpi $onGH\misc\irbrc ~\.irbrc

# #=> secure
# endi ~/encrypted
# endi ~/.ssh
# #=> vim flavours - minimap
# cp $ITscc\forMSWin\code-minimap-v0.6.7-x86_64-pc-windows-msvc\code-minimap.exe $HADL\Microsoft\WindowsApps\code-minimap.exe

# #=> vim flavours - nvim 0 nvim 0 clear
# if ( test-path $nvim ) { ri -path $nvim -recurse } ; md $nvim\pack

# #=> vim flavours - nvim 0 nvim 1 test

# #=> vim flavours - nvim 0 nvim 1 use
# syli $vfv/after              $nvim/after
# syli $vfv/filetype.vim       $nvim/filetype.vim
# syli $vfv/ftplugin           $nvim/ftplugin
# syli $vimfiles/nvim/init.vim $nvim/init.vim
# syli $vimfiles/nvim/lua      $nvim/lua
# syli $vfv/packs/packs-colo   $nvim/pack/colo
# syli $vfv/packs/packs-cp     $nvim/pack/cp
# syli $vfv/packs/packs-unix   $nvim/pack/unix
# syli $vfv/plugin/packs.vim   $nvim/plugin/packs.vim
# syli $vfv/plugin/plugin.vim  $nvim/plugin/plugin.vim
# syli $vfv/spell              $nvim/spell
# syli $vfv/syntax             $nvim/syntax
# syli $vfv/thesaurus          $nvim/thesaurus

# #=> vim flavours - vim - vimfiles 0 clear
# if ( test-path ~\vimfiles ) { ri -path ~\vimfiles -recurse } ; md ~\vimfiles\pack

# # g $home\vimfiles

# #=> vim flavours - vim - vimfiles 1 test
# syli $vimfiles/test/filetype.vim        ~/vimfiles/filetype.vim
# syli $vimfiles/test/plugin/packs.vim    ~/vimfiles/plugin/packs.vim
# syli $vimfiles/test/plugin/packsVim.vim ~/vimfiles/plugin/packsVim.vim
# syli $vimfiles/test/plugin/plugin.vim   ~/vimfiles/plugin/plugin.vim
# syli $vfv/enter/Win10Paths.vim ~/vimfiles/Win10Paths.vim
# syli $vfv/ftplugin             ~/vimfiles/ftplugin
# syli $vfv/packs/packs-colo     ~/vimfiles/pack/colo
# syli $vfv/packs/packs-cp       ~/vimfiles/pack/cp
# syli $vfv/packs/packs-unix     ~/vimfiles/pack/unix
# syli $vfv/plugin/fzf           ~/vimfiles/plugin/fzf
# syli $vfv/spell                ~/vimfiles/spell
# syli $vfv/syntax               ~/vimfiles/syntax
# syli $vfv/thesaurus            ~/vimfiles/thesaurus

# #=> vim flavours - vim - vimfiles 1 use
# syli $vfv/after                ~/vimfiles/after
# syli $vfv/enter/Win10Paths.vim ~/vimfiles/Win10Paths.vim
# syli $vfv/filetype.vim         ~/vimfiles/filetype.vim
# syli $vfv/ftplugin             ~/vimfiles/ftplugin
# syli $vfv/packs/packs-colo     ~/vimfiles/pack/colo
# syli $vfv/packs/packs-cp       ~/vimfiles/pack/cp
# syli $vfv/packs/packs-unix     ~/vimfiles/pack/unix
# syli $vfv/packs/packs-win64    ~/vimfiles/pack/win64
# syli $vfv/plugin/fzf           ~/vimfiles/plugin/fzf
# syli $vfv/plugin/packs.vim     ~/vimfiles/plugin/packs.vim
# syli $vfv/plugin/packsVim.vim  ~/vimfiles/plugin/packsVim.vim
# syli $vfv/plugin/plugin.vim    ~/vimfiles/plugin/plugin.vim
# syli $vfv/spell                ~/vimfiles/spell
# syli $vfv/syntax               ~/vimfiles/syntax
# syli $vfv/thesaurus            ~/vimfiles/thesaurus

#=> vim flavours - vim - vimrc
syli $MSWin10\mb\_gvimrc ~/_gvimrc
syli $MSWin10\mb\_vimrc-AZERTY ~/_vimrc

# #=> ~\.bashrc
# syli $MSWin10\bashrc ~\.bashrc

#=> ~\.gitconfig
syli $MSwin10\mb\gitconfig ~\.gitconfig
# b $HOME\.gitconfig
# csl ~\.gitconfig

