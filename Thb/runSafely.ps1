# vim: fdl=1:

# Joseph Harriott - lun. 04 mars 2024

# run Mozilla Thunderbird safely from profile shared on Dropbox
# -------------------------------------------------------------
# for  $MSWin10\AZERTY.ahk
#  APS> ni C:\MT-runSafely.ps1 -itemtype symboliclink -value $MSwin10\Thb\runSafely.ps1 -Force
#  csl C:\MT-runSafely.ps1

# Test this script:
#  ni -Path "$Drpbx\JH\Thb-dr" -name 'linuxlock'
#  $Env:Computername > $Drpbx\JH\Thb-dr\linuxlock
#  gc $Drpbx\JH\Thb-dr\linuxlock
#  pwsh -nop -w minimized -f C:\MT-runSafely.ps1

$Drpbx = "$env:userprofile\Dropbox"
$Thbshort = "JH\Thb-dr"
$Thb = "$Drpbx\$Thbshort"
$lf = "$Thb\linuxlock"
if ( test-path $lf) {
  $h = gc $lf
  toast -AppLogo C:\MT\chrome\icons\default\messengerWindow.ico -Text "? $h > linux > Thunderbird", "Dropbox\$Thbshort"
}
else {
  echo $Cn > $Thb\Win10ProLock  # noting that Thunderbird is active here
  start thunderbird
  }

