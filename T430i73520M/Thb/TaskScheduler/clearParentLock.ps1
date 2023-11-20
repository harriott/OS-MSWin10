# vim: fdl=2:

# Joseph Harriott - Sat 12 Nov 2022

# remove my  $Thb\Win10ProLock  if Thunderbird isn't running
# ----------------------------------------------------------
# see  $machine\T91\runSafely.ps1
#  test-path $Thb\Win10ProLock

# for  Task Scheduler
#  APS> ni C:\MT-clearParentLock.ps1 -itemtype symboliclink -value $machine\Thb\TaskScheduler\clearParentLock.ps1 -Force
#   gc C:\MT-clearParentLock.ps1
#  iex "$machine\T91\TaskScheduler\clearParentLock.ps1"
#  Import Task > $machine\T91\TaskScheduler\removeParentLock.xml
#   (Task will stop repeating if tweaked or Run manually - fix is to Sign in again...)

# Test:
#  ni -Path 'C:\Users\troin\Dropbox\JH\Thb-dr' -name 'Win10ProLock'
#  pwsh -NoProfile -WindowStyle Hidden -File C:\MT-clearParentLock.ps1
#  pwsh -NoProfile -WindowStyle Minimized -File C:\MT-clearParentLock.ps1

$Drpbx = "C:\Users\troin\Dropbox"
$Thbshort = "JH\Thb-dr"
$Thb = "$Drpbx\$Thbshort"
# $Thb\parent.lock  is kept in use by  Thunderbird  and so isn't sync'd by  Dropbox  until  Thunderbird closes
# <dot>parentlock  seems to be a relic
$W10PL = 'Win10ProLock'
if ( ! (Get-Process thunderbird -ErrorAction SilentlyContinue) ) {
  if ( test-path "$Thb\$W10PL" ) {
    ri $Thb\$W10PL
    New-BurntToastNotification -AppLogo C:\MozillaThunderbird\chrome\icons\default\messengerWindow.ico -Text "removed $W10PL", $Thbshort
  }
}

