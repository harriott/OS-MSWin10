# vim: set et tw=0:

# Joseph Harriott

# restart PowerShell if you change anything here

# symlink this file to  C:\Users\jnbh\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Clear-Host

# helps to define these also in  $HOME\_vimrc
$ITstack = "D:\Dropbox\JH\core\IT_stack"
  $onGH = "$ITstack\onGitHub"
    $MSwin = "$onGH\MSWin10"
      $machine = "$MSWin\HPP11n012na"
    $SPDHPP = "$onGH\SyncPortableDrives\HPP"

. $MSWin\PSProfile.ps1

New-Alias RCS0 $SPDHPP\RC-Sync0.ps1
New-Alias RCS1 $SPDHPP\RC-Sync1.ps1
New-Alias RCSh $SPDHPP\RC-Share.ps1
New-Alias RCSm $SPDHPP\RC-Flash.ps1

