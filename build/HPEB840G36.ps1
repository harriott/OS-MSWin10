# vim: set fdl=2:

# $MSWin10/build/HPEB840G36.ps1

function rhgc { Read-Host "- good to continue? " }

#=> 0 precursors
sl $MSn/PS  # or get there manually if  $MSn  not yet defined
  . _noDropbox.ps1
. $MSn/set/0-_MSn.ps1
rhgc

#=> 1 setup my $core/IT (non-essential)
robocopy /mir E:\core\IT D:\ITr-coreIT  # from K16GBDTG2
rhgc

#=> 1 setup my tools 0 directories
# - see  $MSn/PS/Profile.ps1
endi D:/ITJ/ml/PSH
endi D:/ITJ/ml/packages
rhgc

#=> 1 setup my tools 1 $vimfiles - robocopy from USB
# robocopy /mir E:\ITr\coreIT\onGitHub\vimfiles D:\ITJ\RC-vimfiles  # from TOSHIBA
robocopy /mir E:\core\IT\onGitHub\vimfiles D:\ITJ\RC-vimfiles  # from K16GBDTG2
$gc = 'D:\ITJ\RC-vimfiles\.git\config'; (gc $gc).replace('git@github.com:','https://github.com/') | seco -encoding utf8 $gc
# in  .git\config, change  git@github.com:  to  https://github.com/
rhgc

# #=> 1 setup my tools 1 git clones
# git clone https://github.com/harriott/OS-MSWin10 D:\ITJ\gc-OS-MSWin10
# git clone https://github.com/harriott/misc D:\ITJ\gc-misc
# git clone https://github.com/harriott/vimfiles D:\ITJ\gc-vimfiles
# rhgc

#=> 1 setup my tools 1 git pulls
sl D:\ITJ\gc-OS-MSWin10; git pull
sl D:\ITJ\gc-misc; git pull
sl D:\ITJ\gc-vimfiles; git pull
rhgc

#=> 1 setup my tools 2 $vimfiles - update from git clone
robocopy \E D:\ITJ\gc-vimfiles D:\ITJ\RC-vimfiles  # no /mir = no /purge - won't remove abandoned files
rhgc

