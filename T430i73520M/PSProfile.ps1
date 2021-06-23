# vim: set et tw=0:

# Joseph Harriott

# restart PowerShell if you change anything here

# symlink this file to  ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Clear-Host

#region --- 1 paths

$core = "C:\Users\troin\Dropbox\JH\core"
  $ITstack = "$core\IT_stack"
    $onGH = "$ITstack\onGitHub"
      $MSwin10 = "$onGH\MSWin10"
        $machine = "$MSWin10\T430i73520M"

#endregion
#region --- 2 more functionality

. $MSWin10\PSProfile.ps1  # also uses $onGH ($MSWin10/PSProfile.ps1)

# New-Alias RCI $onGH\SyncPortableDrives\RoboCopy\IdeaPad.ps1  # ($onGH/SyncPortableDrives/RoboCopy/IdeaPad.ps1)

#endregion
