# vim: fdl=1:

# Joseph Harriott - Wed 25 May 2022

# run Mozilla Thunderbird safely from profile shared on Dropbox
# -------------------------------------------------------------
# for  $MSwin10\jo.ahk
#  APS> ni C:\MT-runSafely.ps1 -itemtype symboliclink -value $machine\T91\runSafely.ps1 -Force

# Test BurntToast:
#  New-BurntToastNotification -AppLogo C:\MozillaThunderbird\chrome\icons\default\messengerWindow.ico -Text "? > linux > Thunderbird"

# Test this script:
#  ni -Path 'C:\Users\troin\Dropbox\JH\T91-default-release' -name 'linuxlock'
#  ni -Path '$DROPBOX\JH\T91-default-release' -name 'linuxlock'
#  $Env:Computername > $DROPBOX\JH\T91-default-release\linuxlock
#  pwsh -NoProfile -WindowStyle Minimized -File C:\MT-runSafely.ps1

$DROPBOX = "C:\Users\troin\Dropbox"
$T91short = "JH\T91-default-release"
$T91 = "$DROPBOX\$T91short"
$lf = "$T91\linuxlock"
if ( Test-Path $lf) {
  $h = gc $lf
  New-BurntToastNotification -AppLogo C:\MozillaThunderbird\chrome\icons\default\messengerWindow.ico -Text "? $h > linux > Thunderbird", "Dropbox\$T91short"
}
else { start thunderbird }

