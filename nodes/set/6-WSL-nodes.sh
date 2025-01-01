#!/bin/bash
# vim: fdl=1:

# after  $MSn/set/7-WSL-prep_profile.sh  has preset  $MSn/WSL/bash_profile
#  . $MSn/set/6-WSL-nodes.sh

# #=> 0 Bash symlinks
# ln -sf $MSn/WSL/bash_profile ~/.bash_profile
# # makes  \\wsl$\Ubuntu\home\jo\.bash_profile  unusable, so check with  ls -l ~/.bash_profile
# ln -sf $MSn/WSL/bashrc ~/.bashrc
# echo '- now open a new shell'

# #=> 0 make vimswap
# [ ! -d ~/.vimswap ] && mkdir ~/.vimswap

#=> 0 ranger
rsync -irtv --delete $OSAB/terminal/ranger/ ~/.config/ranger

# #=> 0 tmux symlinks
# ln -sf $OSL/GNUReadline-inputrc ~/.inputrc
# ln -sf $OSL/nodes/tmux/tmux.conf ~/.tmux.conf

# #=> 0 symlink vimrc
# ln -sf $MSn/WSL/vimrc ~/.vimrc

# #=> 1 check ~ symlinks
# l -al ~

# #=> 2 vimfiles - vim configurations - clear
# [ -d ~/.vim ] && sudo rm -r ~/.vim
# mkdir -p ~/.vim/pack
# mkdir ~/.vim/plugin

# #=> 3 vimfiles - vim configurations - load
# rsync -irtv --delete $vimfiles/vim/after/               ~/.vim/after
# rsync -itv $vimfiles/vim/filetype.vim                   ~/.vim/filetype.vim
# rsync -irtv --delete $vimfiles/vim/ftplugin/            ~/.vim/ftplugin
# rsync -irtv --delete $vimfiles/vim/packs/packs-colo/    ~/.vim/pack/colo
# rsync -irtv --delete $vimfiles/vim/packs/packs-cp-all/  ~/.vim/pack/cp-all
# rsync -itv $vfv/plugin/packs.vim                        ~/.vim/plugin/packs.vim
# rsync -itv $vfv/plugin/plugin.vim                       ~/.vim/plugin/plugin.vim
# rsync -irtv --delete $vimfiles/vim/spell/               ~/.vim/spell
# rsync -irtv --delete $vimfiles/vim/syntax/              ~/.vim/syntax
# rsync -irtv --delete $vimfiles/vim/thesaurus/           ~/.vim/thesaurus
# rsync -itv $vfv/enter/vimrc.vim                         ~/.vim/vimrc.vim
# rsync -itv $vfv/enter/vimrc_example.vim                 ~/.vim/vimrc_example.vim
# rsync -itv $vfv/enter/vimrc-WSL.vim                     ~/.vim/vimrc-WSL.vim

