# vim: fdl=2:

# Joseph Harriott - Fri 09 Feb 2024

# remove my  $Thb\Win10ProLock  if Thunderbird isn't running
# ----------------------------------------------------------
# see  $machBld\Thb\runSafely.ps1
#  test-path $Thb\Win10ProLock
#  iex "$machBld\Thb\TaskScheduler\clearParentLock.ps1"

# for  Task Scheduler
#  APS> ni C:\MT-clearParentLock.ps1 -itemtype symboliclink -value $machBld\Thb\TaskScheduler\clearParentLock.ps1 -Force
#   csl C:\MT-clearParentLock.ps1
#  Import Task > $machBld\Thb\TaskScheduler\removeParentLock.xml
#   (Task will stop repeating if tweaked or Run manually - fix is to  Sign in  again...)

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

