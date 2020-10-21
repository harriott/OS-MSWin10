# vim: set et tw=0:

# Joseph Harriott

# restart PowerShell if you change anything here

# symlink this file to  C:\Users\jnbh\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Clear-Host

# helps to define these also in  $HOME\_vimrc
$defaults = "$Env:AppData\Pandoc\defaults"
$ITstack = "D:\Dropbox\JH\core\IT_stack"
  $onGH = "$ITstack\onGitHub"
    $MD4PDF = "$onGH\md4pdf"
    $MSwin = "$onGH\MSWin10"
      $machine = "$MSWin\HPP11n012na"
    $SPDHPP = "$onGH\SyncPortableDrives\RoboCopy\HPP"

. $MSWin\PSProfile.ps1

New-Alias RCS0 $SPDHPP\Sync0.ps1
New-Alias RCS1 $SPDHPP\Sync1.ps1
New-Alias RCSh $SPDHPP\Share.ps1
New-Alias RCSm $SPDHPP\Flash.ps1

