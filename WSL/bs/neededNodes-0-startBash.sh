#!/bin/bash
# vim: fdl=1:

# build script  $MSWSL/bs/neededNodes-0-startBash.sh

# bash /mnt/d/Dropbox/JH/core/IT_stack/onGitHub/OS-MSWin10/WSL/bs/neededNodes-0-startBash.sh

set -e

#=> Bash 0 setup
for f in ~/.bash_profile ~/.profile; do [ -f "$f" ] && rm $f; done
cp /mnt/d/Dropbox/JH/core/IT_stack/onGitHub/OS-MSWin10/WSL/bash_profile ~/.bash_profile
echo '- now open a new shell'

