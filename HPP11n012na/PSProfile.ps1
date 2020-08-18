# vim: set et tw=0:

# Joseph Harriott

# restart PowerShell if you change anything here

# symlink this file to  C:\Users\jnbh\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Clear-Host

# these variables are unfortunately inaccessible to vim
$machineName = 'HPP11n012na'
$onGH = "D:\Dropbox\JH\IT_stack\onGitHub"

. $onGH\MSWin10\PSProfile.ps1

New-Alias RCS0 $onGH\SyncPortableDrives\RoboHPP-Sync0.ps1
New-Alias RCS1 $onGH\SyncPortableDrives\RoboHPP-Sync1.ps1
New-Alias RCSh $onGH\SyncPortableDrives\RoboSM3_Share.ps1
New-Alias RCSm $onGH\SyncPortableDrives\RoboSmall.ps1

