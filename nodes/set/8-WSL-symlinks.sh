#!/bin/bash
# vim: fdl=1:

# after  $MSn/set/7-WSL-prep_profile.sh  has preset  $MSn/WSL/bash_profile
#  bash $MSn/set/8-WSL-symlinks.sh

set -e

#=> 0 Bash symlinks
ln -sf $MSn/WSL/bash_profile ~/.bash_profile
# makes  \\wsl$\Ubuntu\home\jo\.bash_profile  unusable, so check with  ls -l ~/.bash_profile
ln -sf $MSn/WSL/bashrc ~/.bashrc
echo '- now open a new shell'

#=> 0 tmux
ln -sf $OSL/GNUReadline-inputrc ~/.inputrc
ln -sf $OSL/tmux/tmux.conf ~/.tmux.conf

#=> 1 check
ls -al ~

