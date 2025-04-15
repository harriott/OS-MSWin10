
# Joseph Harriott - https://harriottgithubio/ - ven 24 janv 2025

# once  $Cn, APS> . $MSn/set/3.ps1

# csl, endi & syli  defined in  $MSn/PS/Profile.ps1

csl ~\PSProfile.ps1

#=> Emacs
$Ed = "$HADR\.emacs.d"; endi $Ed
syli $misc\CP\emacs\custom.el $Ed\custom.el
syli $core\TextNotes\Emacs\diary $Ed\diary
syli $misc\CP\emacs\early-init.el $Ed\early-init.el
syli $onGH\harriott-zenburn-emacs $Ed\harriott-zenburn-emacs
syli $misc\CP\emacs\init.el $Ed\init.el
syli $misc\CP\emacs\lisp $Ed\lisp
  csl $HADR\.emacs.d

#=> gokcehan lf configuration
syli $MSn\lf\colors $HADL\lf\colors
syli $MSn\lf\lfrc $HADL\lf\lfrc
syli $MSn\lf\icons $HADL\lf\icons
  csl $HADL\lf

#=> MiKTeX
syli $ITsCP\documenting\LaTeX\jo $tex\latex\jo  # csl $tex\latex
#  after changes:  miktex fndb refresh
#  ii "$tex\latex\jo"
#  sl $tex\latex
  csl $tex\latex

#=> Mozilla Thunderbird safely
syli $MSn\Thb\clearWin10ProLock.ps1 C:\MT-clearWin10ProLock.ps1
  csl C:\MT-clearWin10ProLock.ps1
syli $MSn\Thb\runSafely.ps1 C:\MT-runSafely.ps1
  csl C:\MT-runSafely.ps1

#=> mpv
syli $misc/CP/mpv.conf $HADR/mpv/mpv.conf

# #=> Node.js
# endi $HADR\npm

# #=> Pandoc m4p
# endi $tex\latex\m4p

#=> Pandoc\defaults
$Pd = "$Pandoc\defaults"; endi $Pd
syli $MD4PDF\defaults-toc.yaml "$Pd\md4pdfToC.yaml"
syli $MD4PDF/defaults.yaml "$Pd\md4pdf.yaml"
  csl $Pandoc\defaults

#=> Pandoc\templates
$Pt = "$Pandoc\templates"; endi $Pt
syli $onGH\pandoc-templates "$Pt"
  csl $Pandoc

# #=> Ruby
# cpi $onGH\misc\irbrc ~\.irbrc

# #=> secure
# endi ~/encrypted
# endi ~/.ssh

# #=> vim flavours - minimap
# cp $ITscc\forMSWin\code-minimap-v0.6.7-x86_64-pc-windows-msvc\code-minimap.exe $HADL\Microsoft\WindowsApps\code-minimap.exe

#=> vim flavours - nvim 0 nvim 0 clear
if ( test-path $nvim ) { ri -path $nvim -recurse } ; md $nvim\pack

# #=> vim flavours - nvim 0 nvim 1 test

#=> vim flavours - nvim 0 nvim 1 use
syli $vfv/after               $nvim/after
syli $vfv/filetype.vim        $nvim/filetype.vim
syli $vfv/ftplugin            $nvim/ftplugin
syli $vfn/init.vim  $nvim/init.vim
syli $vfn/lua       $nvim/lua
syli $vfv/packs/packs-colo    $nvim/pack/colo
syli $vfv/packs/packs-cp-all  $nvim/pack/cp-all
syli $vfv/packs/packs-cp-full $nvim/pack/cp-full
syli $vfv/packs/packs-unix    $nvim/pack/unix
syli $vfv/plugin/packs.vim    $nvim/plugin/packs.vim
syli $vfv/plugin/plugin.vim   $nvim/plugin/plugin.vim
syli $vfv/spell               $nvim/spell
syli $vfv/syntax              $nvim/syntax
syli $vfv/thesaurus           $nvim/thesaurus
  csl $nvim; csl $nvim/pack

#=> vim flavours - vim - vimfiles 0 clear
if ( test-path ~\vimfiles ) { ri -path ~\vimfiles -recurse } ; md ~\vimfiles\pack

# g $home\vimfiles

#=> vim flavours - vim - vimfiles 0 vimrc
syli $MSn\Vim\_gvimrc ~/_gvimrc
  csl ~/_gvimrc
syli $MSn\Vim\_vimrc-AZERTY ~/_vimrc
  csl ~/_*vimrc

# #=> vim flavours - vim - vimfiles 1 test
# syli $vimfiles/test/filetype.vim        ~/vimfiles/filetype.vim
# syli $vimfiles/test/plugin/packs.vim    ~/vimfiles/plugin/packs.vim
# syli $vimfiles/test/plugin/plugin.vim   ~/vimfiles/plugin/plugin.vim
# syli $vfv/enter/Win10Paths.vim          ~/vimfiles/Win10Paths.vim
# syli $vfv/ftplugin                      ~/vimfiles/ftplugin
# syli $vfv/packs/packs-colo              ~/vimfiles/pack/colo
# syli $vfv/packs/packs-cp                ~/vimfiles/pack/cp
# syli $vfv/packs/packs-unix              ~/vimfiles/pack/unix
# syli $vfv/plugin/fzf                    ~/vimfiles/plugin/fzf
# syli $vfv/spell                         ~/vimfiles/spell
# syli $vfv/syntax                        ~/vimfiles/syntax
# syli $vfv/thesaurus                     ~/vimfiles/thesaurus
# csl ~/vimfiles

#=> vim flavours - vim - vimfiles 1 use
syli $vfv/after                ~/vimfiles/after
syli $vfv/enter/Win10Paths.vim ~/vimfiles/Win10Paths.vim
syli $vfv/filetype.vim         ~/vimfiles/filetype.vim
syli $vfv/ftplugin             ~/vimfiles/ftplugin
syli $vfv/packs/packs-colo     ~/vimfiles/pack/colo
syli $vfv/packs/packs-cp-all   ~/vimfiles/pack/cp-all
syli $vfv/packs/packs-cp-full  ~/vimfiles/pack/cp-full
syli $vfv/packs/packs-unix     ~/vimfiles/pack/unix
syli $vfv/packs/packs-win64    ~/vimfiles/pack/win64
syli $vfv/plugin/fzf           ~/vimfiles/plugin/fzf
syli $vfv/plugin/packs.vim     ~/vimfiles/plugin/packs.vim
syli $vfv/plugin/plugin.vim    ~/vimfiles/plugin/plugin.vim
syli $vfv/spell                ~/vimfiles/spell
syli $vfv/syntax               ~/vimfiles/syntax
syli $vfv/thesaurus            ~/vimfiles/thesaurus
  csl ~/vimfiles

#=> ~\.bashrc
syli $MSn\bashrc ~\.bashrc
  csl ~/.bashrc

#=> ~\.gitconfig
syli $MSn\gitconfig ~\.gitconfig
  csl ~\.gitconfig
# b $HOME\.gitconfig

