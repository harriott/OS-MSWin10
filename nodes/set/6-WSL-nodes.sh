#!/bin/bash
# vim: fdl=1:

#  . $MSn/set/6-WSL-nodes.sh

#=> 0 clm
[ ! -d $maild ] && mkdir -p $maild
    for ma in fm gmx zou; do [ ! -d $maild/$ma ] && mkdir $maild/$ma; done
    ls $maild
cp -f $lclm/mbsyncrc-backup ~/.mbsyncrc
    sed -i 's!TLSType!SSLType!' ~/.mbsyncrc
    # \\wsl$\Ubuntu-24.04\home\jo\.mbsyncrc
cp -f $lclm/notmuch-config-backup ~/.notmuch-config
    # \\wsl$\Ubuntu-24.04\home\jo\.notmuch-config

# #=> 0 gpg initialise
# gpg -k  # resets ~/.gnupg

#=> 0 config
[ -d ~/.config ] || mkdir ~/.config

#=> 0 hushlogin
[ -s ~/.hushlogin ] || touch ~/.hushlogin

#=> 0 vimswap
[ -d ~/.vimswap ] || mkdir ~/.vimswap

#=> 0 tmux symlinks
ln -sf $OSL/nodes/GNUReadline-inputrc ~/.inputrc
ln -sf $OSL/nodes/terminal-tmux/tmux.conf ~/.tmux.conf

#=> 0 symlink vimrc
ln -sf $MSn/WSL/vimrc ~/.vimrc

#=> 1 gpg-agent.conf
ln -sf $OSL/nodes/gpg-agent.conf ~/.gnupg/gpg-agent.conf  # ls ~/.gnupg

#=> 1 ranger
rsync -irtv --delete $OSL/nodes/terminal-ranger/ ~/.config/ranger

#=> 2 check ~ symlinks
l -al ~

#=> 3 vimfiles - vim configurations - clear
[ -d ~/.vim ] && sudo rm -r ~/.vim
mkdir -p ~/.vim/pack
mkdir ~/.vim/plugin

#=> 4 vimfiles - vim configurations - load
read -p 'hit Enter to begin the rsyncs'
rsync -irtv --delete $vimfiles/vim/after/               ~/.vim/after
rsync -itv $vimfiles/vim/filetype.vim                   ~/.vim/filetype.vim
rsync -irtv --delete $vimfiles/vim/ftplugin/            ~/.vim/ftplugin
rsync -irtv --delete $vimfiles/vim/packs/packs-colo/    ~/.vim/pack/colo
rsync -irtv --delete $vimfiles/vim/packs/packs-cp-all/  ~/.vim/pack/cp-all
rsync -itv $vfv/plugin/packs.vim                        ~/.vim/plugin/packs.vim
rsync -itv $vfv/plugin/plugin.vim                       ~/.vim/plugin/plugin.vim
rsync -irtv --delete $vimfiles/vim/spell/               ~/.vim/spell
rsync -irtv --delete $vimfiles/vim/syntax/              ~/.vim/syntax
rsync -irtv --delete $vimfiles/vim/thesaurus/           ~/.vim/thesaurus
rsync -itv $vfv/enter/vimrc.vim                         ~/.vim/vimrc.vim
rsync -itv $vfv/enter/vimrc_example.vim                 ~/.vim/vimrc_example.vim
rsync -itv $vfv/enter/vimrc-WSL.vim                     ~/.vim/vimrc-WSL.vim

