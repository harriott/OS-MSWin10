# vim: fdl=2:

# Joseph Harriott - lun 27 janv 2025

# remove my  $Thb\Win10ProLock  if Thunderbird isn't running
# ----------------------------------------------------------
# for  $MSn\AutoHotkey\AZERTY.ahk
#  APS> syli $MSn\Thb\clearWin10ProLock.ps1 C:\MT-clearWin10ProLock.ps1
#   bat C:\MT-clearWin10ProLock.ps1
#   csl C:\MT-clearWin10ProLock.ps1

# Test:
#  $Cn > $Thb\Win10ProLock
#  'other' > $Thb\Win10ProLock
#  'dud' > $Thb\parent.lock
#  & C:\MT-clearWin10ProLock.ps1

$Drpbx = "D:\Dropbox"
$Thb = "$Drpbx\JH\Thb-dr"
# ls $Thb\parent.lock  is kept in use by  Thunderbird
#  and so isn't sync'd by  Dropbox  until  Thunderbird closes
# <dot>parentlock  seems to be a relic
if ( ! (Get-Process thunderbird -ErrorAction SilentlyContinue) ) {
  if ( test-path "$Thb\parent.lock" ) {
    $removed = 'parent.lock '
    ri $Thb\parent.lock
  }
  if ( test-path "$Thb\Win10ProLock" ) {
    $removed = $removed + 'Win10ProLock'
    ri $Thb\Win10ProLock
  }
  . C:\MT-tT.ps1
  if ( $removed ) { tT "removed $removed" }
}

