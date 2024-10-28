# vim: fdl=2:

# Joseph Harriott - ven 11 oct 2024

# remove my  $Thb\Win10ProLock  if Thunderbird isn't running
# ----------------------------------------------------------
# for  $MSn\AutoHotkey\AZERTY.ahk
#  APS> syli $MSn\Thb\clearWin10ProLock.ps1 C:\MT-clearWin10ProLock.ps1
#   bat C:\MT-clearWin10ProLock.ps1
#   csl C:\MT-clearWin10ProLock.ps1

# Test:
#  echo $Cn > $Thb\Win10ProLock
#  echo dud > $Thb\parent.lock
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
  if ( $removed ) { toast -AppLogo C:\MT\chrome\icons\default\messengerWindow.ico -Text "Thunderbird", "removed $removed" }
}

