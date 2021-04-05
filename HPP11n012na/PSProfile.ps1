
# Joseph Harriott

# restart PowerShell if you change anything here

# symlink this file to  C:\Users\jnbh\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# Clear-Host

# helps to define these also in  $HOME\_vimrc
$ITstack = "D:\Dropbox\JH\core\IT_stack"
  $onGH = "$ITstack\onGitHub"
    $MSwin = "$onGH\MSWin10"
      $machine = "$MSWin\HPP11n012na"
    $SPDHPP = "$onGH\SyncPortableDrives\RoboCopy\HPP"

. $MSWin\PSProfile.ps1

New-Alias RCS0 $SPDHPP\Sync0.ps1
New-Alias RCS1 $SPDHPP\Sync1.ps1
New-Alias RCSh $SPDHPP\Share.ps1
New-Alias RCSm $SPDHPP\Flash.ps1

#region --- Pandoc

Function m4p {
  cpi $MD4PDF/iih/headings0.sty $MiKTeX\latex\m4p\headings.sty -force
  PowerShell -NoProfile $onGH\md4pdf\MSWin\m4p.ps1 $args[0] $args[1]
}

Function m4ps0 {
  cpi $MD4PDF/iih/headings0.sty $MiKTeX\latex\m4p\headings.sty -force
  PowerShell -NoProfile $onGH\md4pdf\MSWin\m4ps.ps1
}
# New-Alias m4ps $onGH\md4pdf\MSWin\m4ps.ps1

#endregion

