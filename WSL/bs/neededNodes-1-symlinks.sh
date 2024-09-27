#!/bin/bash
# vim: fdl=1:

# build script

# depends on  $MSWSL/bash_profile  to define  $MSWSL
# bash $MSWSL/bs/neededNodes-1-symlinks.sh

set -e

#=> 0 Bash symlinks
ln -sf $MSWSL/bash_profile ~/.bash_profile
# makes  \\wsl$\Ubuntu\home\jo\.bash_profile  unusable, so check with  ls -l ~/.bash_profile
ln -sf $MSWSL/bashrc ~/.bashrc
echo '- now open a new shell'

#=> 0 tmux
ln -sf $OSL/GNUReadline-inputrc ~/.inputrc
ln -sf $OSL/tmux/tmux.conf ~/.tmux.conf

#=> 1 check
ls -al ~

