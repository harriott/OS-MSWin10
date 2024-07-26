#!/bin/bash
# vim: fdl=1:

# build script

# depends on  $MSWSL\bash_profile  to define  $MSWSL
# bash $MSWSL\bs-symlinks.sh

set -e

ln -sf $MSWSL/bash_profile ~/.bash_profile
# makes  \\wsl$\Ubuntu\home\jo\.bash_profile  unusable, so check with  ls -l ~/.bash_profile
ln -sf $MSWSL/bashrc ~/.bashrc

#=> tmux
ln -sf $OSL/GNUReadline-inputrc ~/.inputrc
ln -sf $OSL/tmux.conf ~/.tmux.conf

