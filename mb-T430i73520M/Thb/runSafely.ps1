# vim: fdl=1:

# Joseph Harriott - Wed 25 May 2022

# run Mozilla Thunderbird safely from profile shared on Dropbox
# -------------------------------------------------------------
# for  $MSwin10\jo.ahk
#  APS> ni C:\MT-runSafely.ps1 -itemtype symboliclink -value $machBld\Thb\runSafely.ps1 -Force
#  gc C:\MT-runSafely.ps1

# Test BurntToast:
#  New-BurntToastNotification -AppLogo C:\MozillaThunderbird\chrome\icons\default\messengerWindow.ico -Text "? > linux > Thunderbird"

# Test this script:
#  ni -Path "$Drpbx\JH\Thb-dr" -name 'linuxlock'
#  $Env:Computername > $Drpbx\JH\Thb-dr\linuxlock
#  gc $Drpbx\JH\Thb-dr\linuxlock
#  pwsh -NoProfile -WindowStyle Minimized -File C:\MT-runSafely.ps1

$Drpbx = "C:\Users\troin\Dropbox"
$Thbshort = "JH\Thb-dr"
$Thb = "$Drpbx\$Thbshort"
$lf = "$Thb\linuxlock"
if ( Test-Path $lf) {
  $h = gc $lf
  New-BurntToastNotification -AppLogo C:\MozillaThunderbird\chrome\icons\default\messengerWindow.ico -Text "? $h > linux > Thunderbird", "Dropbox\$Thbshort"
}
else {
  echo T430i73520M > $Thb\Win10ProLock  # noting that Thunderbird is active here
  start thunderbird
  }

