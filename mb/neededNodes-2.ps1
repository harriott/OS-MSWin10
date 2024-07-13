
# Joseph Harriott - https://harriottgithubio/ - ven 12 juil 2024

# once  $Cn,  APS> . $MSWin10\mb\neededNodes-2.ps1

function endi { if ( ! ( test-path $args[0] ) ) { md $args[0] } } # ensure directory
function syli { ni $args[1] -type symboliclink -value $args[0] -force } # symbolic link

#=> Emacs
$Ed = "$HADR\.emacs.d"; endi $Ed
syli $misc\CP\emacs\custom.el $Ed\custom.el
syli $core\TextNotes\Emacs\diary $Ed\diary
syli $misc\CP\emacs\early-init.el $Ed\early-init.el
syli $onGH\harriott-zenburn-emacs $Ed\harriott-zenburn-emacs
syli $misc\CP\emacs\init.el $Ed\init.el
syli $misc\CP\emacs\lisp $Ed\lisp

#=> gokcehan lf configuration
syli $MSWin10\lf\colors $HADL\lf\colors
syli $MSWin10\lf\lfrc $HADL\lf\lfrc
syli $MSWin10\lf\icons $HADL\lf\icons

#=> LaTeX
syli $CrPl\documenting\LaTeX\jo $tex\latex\jo  # csl $tex\latex
#  after changes:  initexmf --update-fndb
#  ii "$tex\latex\jo"
#  sl $tex\latex

#=> Mozilla Thunderbird safely
syli $MSwin10\Thb\runSafely.ps1 C:\MT-runSafely.ps1
#  csl C:\MT-runSafely.ps1
syli $MSwin10\Thb\clearParentLock.ps1 C:\MT-clearParentLock.ps1
#  csl C:\MT-clearParentLock.ps1

#=> Node.js
md $HADR\npm

#=> Pandoc\defaults
$Pd = "$Pandoc\defaults"; endi $Pd
syli $MD4PDF\defaults-toc.yaml "$Pd\md4pdfToC.yaml"
syli $MD4PDF\defaults.yaml "$Pd\md4pdf.yaml"

#=> Pandoc\templates
$Pt = "$Pandoc\templates"; endi $Pt
syli $onGH\pandoc-templates "$Pt"

#=> Ruby
cpi $onGH\misc\irbrc ~\.irbrc

# #=> secure
# endi ~/encrypted
# endi ~/.ssh
#=> vim flavours - minimap
cp $ITscc\forMSWin\code-minimap-v0.6.7-x86_64-pc-windows-msvc\code-minimap.exe $HADL\Microsoft\WindowsApps\code-minimap.exe

#=> vim flavours - nvim
if ( test-path $nvim ) { ri -path $nvim -recurse } ; md $nvim\pack

syli $vimfiles/vim/after             $nvim/after
syli $vimfiles/vim/filetype.vim      $nvim/filetype.vim
syli $vimfiles/vim/ftplugin          $nvim/ftplugin
syli $vimfiles/nvim/init.vim         $nvim/init.vim
syli $vimfiles/nvim/lua              $nvim/lua
syli $vimfiles/vim/packs/packs-colo  $nvim/pack/colo
syli $vimfiles/vim/packs/packs-cp    $nvim/pack/cp
syli $vimfiles/vim/packs/packs-unix  $nvim/pack/unix
syli $vimfiles/vim/plugin/packs.vim  $nvim/plugin/packs.vim
syli $vimfiles/vim/plugin/plugin.vim $nvim/plugin/plugin.vim
syli $vimfiles/vim/spell             $nvim/spell
syli $vimfiles/vim/syntax            $nvim/syntax
syli $vimfiles/vim/thesaurus         $nvim/thesaurus

#=> vim flavours - vim
# syli $machBld\_gvimrc ~/_gvimrc
syli $MSWin10\mb\_gvimrc ~/_gvimrc
syli $MSWin10\mb\_vimrc-AZERTY ~/_vimrc

#==> vim
if ( test-path ~\vimfiles ) { ri -path ~\vimfiles -recurse } ; md ~\vimfiles\pack

syli $vimfiles/vim/after                ~/vimfiles/after
syli $vimfiles/vim/enter/Win10Paths.vim ~/vimfiles/Win10Paths.vim
syli $vimfiles/vim/filetype.vim         ~/vimfiles/filetype.vim
syli $vimfiles/vim/ftplugin             ~/vimfiles/ftplugin
syli $vimfiles/vim/packs/packs-colo     ~/vimfiles/pack/colo
syli $vimfiles/vim/packs/packs-cp       ~/vimfiles/pack/cp
syli $vimfiles/vim/packs/packs-unix     ~/vimfiles/pack/unix
syli $vimfiles/vim/packs/packs-win64    ~/vimfiles/pack/win64
syli $vimfiles/vim/plugin/fzf           ~/vimfiles/plugin/fzf
syli $vimfiles/vim/plugin/packs.vim     ~/vimfiles/plugin/packs.vim
syli $vimfiles/vim/plugin/packsVim.vim  ~/vimfiles/plugin/packsVim.vim
syli $vimfiles/vim/plugin/plugin.vim    ~/vimfiles/plugin/plugin.vim
syli $vimfiles/vim/spell                ~/vimfiles/spell
syli $vimfiles/vim/syntax               ~/vimfiles/syntax
syli $vimfiles/vim/thesaurus            ~/vimfiles/thesaurus

# g $home\vimfiles

# #==> vim test
# if ( test-path ~\vimfiles ) { ri -path ~\vimfiles -recurse } ; md ~\vimfiles\pack

# syli $vimfiles/test/filetype.vim        ~/vimfiles/filetype.vim
# syli $vimfiles/test/plugin/packs.vim    ~/vimfiles/plugin/packs.vim
# syli $vimfiles/test/plugin/packsVim.vim ~/vimfiles/plugin/packsVim.vim
# syli $vimfiles/test/plugin/plugin.vim   ~/vimfiles/plugin/plugin.vim
# syli $vimfiles/vim/enter/Win10Paths.vim ~/vimfiles/Win10Paths.vim
# syli $vimfiles/vim/ftplugin             ~/vimfiles/ftplugin
# syli $vimfiles/vim/packs/packs-colo     ~/vimfiles/pack/colo
# syli $vimfiles/vim/packs/packs-cp       ~/vimfiles/pack/cp
# syli $vimfiles/vim/packs/packs-unix     ~/vimfiles/pack/unix
# syli $vimfiles/vim/plugin/fzf           ~/vimfiles/plugin/fzf
# syli $vimfiles/vim/spell                ~/vimfiles/spell
# syli $vimfiles/vim/syntax               ~/vimfiles/syntax
# syli $vimfiles/vim/thesaurus            ~/vimfiles/thesaurus

# # g $home\vimfiles

#=> ~\.bashrc
syli $MSWin10\bashrc ~\.bashrc

#=> ~\.gitconfig
syli $MSwin10\mb\gitconfig ~\.gitconfig
# b $HOME\.gitconfig
# csl ~\.gitconfig

