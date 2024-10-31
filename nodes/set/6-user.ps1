
# Joseph Harriott - https://harriottgithubio/ - mer 11 sept 2024

# once  $Cn, APS> . $MSn\set\6-user.ps1

# $HDADL, $HDADR, $HDH  defined in  $MSn\PS\Env.ps1
# endi & syli  defined in  $MSWin10\PSProfile.ps1

# #=> gokcehan lf configuration
# syli $MSn\lf\colors $HDADL\lf\colors
# syli $MSn\lf\lfrc $HDADL\lf\lfrc
# syli $MSn\lf\icons $HDADL\lf\icons
# csl $HDADL\lf

# #=> Node.js
# md $HDADR\npm

# #=> Ruby
# cpi $onGH\misc\irbrc $HDH\.irbrc

# #=> vim flavours - minimap
# cp $ITscc\forMSWin\code-minimap-v0.6.7-x86_64-pc-windows-msvc\code-minimap.exe $HDADL\Microsoft\WindowsApps\code-minimap.exe

#=> vim flavours - nvim 0 nvim 0 clear
if ( test-path $nvimD ) { ri -path $nvimD -recurse } ; md $nvimD\pack

#=> vim flavours - nvim 0 nvim 1 use
syli $vfv/after              $nvimD/after
syli $vfv/filetype.vim       $nvimD/filetype.vim
syli $vfv/ftplugin           $nvimD/ftplugin
syli $vimfiles/nvim/init.vim $nvimD/init.vim
syli $vimfiles/nvim/lua      $nvimD/lua
syli $vfv/packs/packs-colo   $nvimD/pack/colo
syli $vfv/packs/packs-cp     $nvimD/pack/cp
syli $vfv/packs/packs-unix   $nvimD/pack/unix
syli $vfv/plugin/packs.vim   $nvimD/plugin/packs.vim
syli $vfv/plugin/plugin.vim  $nvimD/plugin/plugin.vim
syli $vfv/spell              $nvimD/spell
syli $vfv/syntax             $nvimD/syntax
syli $vfv/thesaurus          $nvimD/thesaurus
csl $nvimD

# #=> vim flavours - vim - vimfiles 0 clear
# if ( test-path $HDH\vimfiles ) { ri -path $HDH\vimfiles -recurse } ; md $HDH\vimfiles\pack

# # g $home\vimfiles

# #=> vim flavours - vim - vimfiles 1 use
# syli $vfv/after                $HDH/vimfiles/after
# syli $vfv/enter/Win10Paths.vim $HDH/vimfiles/Win10Paths.vim
# syli $vfv/filetype.vim         $HDH/vimfiles/filetype.vim
# syli $vfv/ftplugin             $HDH/vimfiles/ftplugin
# syli $vfv/packs/packs-colo     $HDH/vimfiles/pack/colo
# syli $vfv/packs/packs-cp       $HDH/vimfiles/pack/cp
# syli $vfv/packs/packs-unix     $HDH/vimfiles/pack/unix
# syli $vfv/packs/packs-win64    $HDH/vimfiles/pack/win64
# syli $vfv/plugin/fzf           $HDH/vimfiles/plugin/fzf
# syli $vfv/plugin/packs.vim     $HDH/vimfiles/plugin/packs.vim
# syli $vfv/plugin/packsVim.vim  $HDH/vimfiles/plugin/packsVim.vim
# syli $vfv/plugin/plugin.vim    $HDH/vimfiles/plugin/plugin.vim
# syli $vfv/spell                $HDH/vimfiles/spell
# syli $vfv/syntax               $HDH/vimfiles/syntax
# syli $vfv/thesaurus            $HDH/vimfiles/thesaurus
# csl $HDH/vimfiles

# #=> vim flavours - vim - vimrc
# syli $MSn\Vim\_gvimrc $HDH/_gvimrc  # csl ~/_gvimrc
# syli $MSn\Vim\_vimrc-AZERTY $HDH/_vimrc
# csl $HDH/_*vimrc

# #=> $HDH\.bashrc
# syli $MSn\bashrc $HDH\.bashrc
# csl $HDH/.bashrc

# #=> $HDH\.gitconfig
# syli $MSn\gitconfig $HDH\.gitconfig
# csl $HDH\.gitconfig

