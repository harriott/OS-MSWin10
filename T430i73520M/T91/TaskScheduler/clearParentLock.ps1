# vim: fdl=2:

# Joseph Harriott - Tue 24 May 2022

# remove Mozilla Thunderbird's  parent.lock  if Thunderbird isn't running
# -----------------------------------------------------------------------
# using  parent.lock  as an indicator on a linux box
#  that Thunderbird is active on this Win10 machine
#  test-path C:\Users\troin\Dropbox\JH\T91-default-release\parent.lock

# for  Task Scheduler
#  APS> ni C:\MT-clearParentLock.ps1 -itemtype symboliclink -value $machine\T91\TaskScheduler\clearParentLock.ps1 -Force
#   gc C:\MT-clearParentLock.ps1
#  iex "$machine\T91\TaskScheduler\clearParentLock.ps1"
#  Import Task > $machine\T91\TaskScheduler\removeParentLock.xml
#   (Task will stop repeating if tweaked or Run manually - fix is to Sign in again...)

# Test:
#  ni -Path 'C:\Users\troin\Dropbox\JH\T91-default-release' -name 'parent.lock'
#  pwsh -NoProfile -WindowStyle Hidden -File C:\clearParentLock.ps1
#  pwsh -NoProfile -WindowStyle Minimized -File C:\clearParentLock.ps1

$Drpbx = "C:\Users\troin\Dropbox"
$T91short = "JH\T91-default-release"
$T91 = "$Drpbx\$T91short"
$pl = 'parent.lock'  # '.parentlock' seems to be a relic
if ( ! (Get-Process thunderbird -ErrorAction SilentlyContinue) ) {
  if ( test-path "$T91\$pl" ) {
    ri $T91\$pl
    New-BurntToastNotification -AppLogo C:\MozillaThunderbird\chrome\icons\default\messengerWindow.ico -Text "removed $pl", $T91short
  }
}

