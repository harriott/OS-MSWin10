# vim: set et tw=0:

# Joseph Harriott

# restart PowerShell if you change anything here

# symlink this file to  C:\Users\troin\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Clear-Host

$core = "C:\Users\troin\Dropbox\JH\core"
  $ITstack = "$core\IT_stack"
    $MSwin = "$onGH\MSWin10"
      $machine = "$MSWin\HPP11n012na"
    $onGH = "$ITstack\onGitHub"

. $onGH\MSWin10\PSProfile.ps1  # uses $onGH

New-Alias RCI $onGH\SyncPortableDrives\RoboCopy\IdeaPad.ps1

