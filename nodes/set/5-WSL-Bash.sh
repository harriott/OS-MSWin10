#!/bin/bash
# vim: fdl=1:

# MSn=/mnt/d/Dropbox/JH/core/IT/onGitHub/OS-MSWin10/nodes; . $MSn/set/5-WSL-Bash.sh

#=> Bash setup
for f in ~/.bash_profile ~/.profile; do [ -f "$f" ] && rm $f; done
ln -sf $MSn/WSL/bash_profile ~/.bash_profile
# makes  \\wsl$\Ubuntu\home\jo\.bash_profile  unusable, so check with  ls -l ~/.bash_profile
ln -sf $MSn/WSL/bashrc ~/.bashrc
echo '- now (after 8s) relaunch Ubuntu'

