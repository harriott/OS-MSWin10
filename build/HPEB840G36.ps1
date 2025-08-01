# vim: set fdl=2:

# $MSWin10/build/HPEB840G36.ps1

#=> 0 precursors
# $MSn/PS  for  _noDropbox.ps1
# $MSn/set  for  0-_MSn.ps1

#=> 1 setup my tools 0 directories
endi D:/ITJ/ml/CHh
endi D:/ITJ/ml/packages

# #=> 1 setup my tools 1 git clones
# git clone https://github.com/harriott/OS-MSWin10 D:\ITJ\gc-OS-MSWin10
# git clone https://github.com/harriott/misc D:\ITJ\gc-misc
# git clone https://github.com/harriott/vimfiles D:\ITJ\gc-vimfiles

#=> 1 setup my tools 2 ITJ
# I was using  $onGH/FM-MSWin-syncDrives/RC-machines/HPEB840G37.ps1
robocopy /mir E:\ITr\coreIT\onGitHub\vimfiles D:\ITJ\RC-vimfiles
$gc = 'D:\ITJ\RC-vimfiles\.git\config'; (gc $gc).replace('git@github.com:','https://github.com/') | seco -encoding utf8 $gc
# in  .git\config, change  git@github.com:  to  https://github.com/

#=> 1 setup my tools 3 update $vimfiles
robocopy \E D:\ITJ\gc-vimfiles D:\ITJ\RC-vimfiles

