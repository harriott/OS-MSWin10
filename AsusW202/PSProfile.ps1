# vim: set fdl=2:

# Joseph Harriott

# restart PowerShell if you change anything here

# symlink this file ($machine\PSProfile.ps1) to
#  ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
#  ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#  - both done in  $machine\Win10ProBuild.txt

# Clear-Host

#region --- 1 paths

$Drpbx = "C:\Users\jharr\Dropbox"
  $core = "$Drpbx\JH\core"
    $ITstack = "$core\IT_stack"
      $CrPl = "$ITstack\CrossPlatform"
      $onGH = "$ITstack\onGitHub"
        $MSwin10 = "$onGH\MSWin10"
          $machine = "$MSWin10\AsusW202"
  $ITP = "$Drpbx\JH\Technos\IT0-Partitionable"  # $ITP\diskUsage.txt
  $cITh = "$Drpbx\JH\copied\IT-handy"
$Enc = 'C:\Users\jharr\Encrypted'

#endregion
#region --- 2 more functionality

. $MSWin10\PSProfile.ps1  # ($MSWin10/PSProfile.ps1) also uses $onGH

#endregion
