#!/bin/bash
# vim: sw=2:

# build script

# depends on  $MSWSL\bash_profile  to define  $MSWSL
# bash $MSWSL/bs-symlinks.sh

set -e

ln -sf $MSWSL/bash_profile ~/.bash_profile
# (makes  \\wsl$\Ubuntu\home\jo\.bash_profile  unusable)

