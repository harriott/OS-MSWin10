#!/bin/bash
# vim: fdl=1:

# MSn=/mnt/d/Dropbox/JH/core/IT_stack/onGitHub/OS-MSWin10/nodes; . $MSn/set/7-WSL-prep_profile.sh

set -e

#=> Bash 0 setup
for f in ~/.bash_profile ~/.profile; do [ -f "$f" ] && rm $f; done
cp /mnt/d/Dropbox/JH/core/IT_stack/onGitHub/OS-MSWin10/WSL/bash_profile ~/.bash_profile
echo '- now open a new shell'

