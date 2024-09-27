# vim: fdl=2:

# Joseph Harriott - jeu 18 juil 2024

# remove my  $Thb\Win10ProLock  if Thunderbird isn't running
# ----------------------------------------------------------
# see  $MSwin10\Thb\runSafely.ps1
#  test-path $Thb\Win10ProLock
#  iex "$MSwin10\Thb\TaskScheduler\clearWin10ProLock.ps1"

# for  $MSWin10\AutoHotkey\AZERTY.ahk
#  APS> syli $MSwin10\Thb\clearWin10ProLock.ps1 C:\MT-clearWin10ProLock.ps1
#   bat C:\MT-clearWin10ProLock.ps1
#   csl C:\MT-clearWin10ProLock.ps1

# Test:
#  echo $Cn > $Thb\Win10ProLock
#  pwsh -nop -WindowStyle Hidden -File C:\MT-clearWin10ProLock.ps1
#  pwsh -nop -WindowStyle Minimized -File C:\MT-clearWin10ProLock.ps1

$Drpbx = "D:\Dropbox"
$Thb = "$Drpbx\JH\Thb-dr"
# $Thb\parent.lock  is kept in use by  Thunderbird
#  and so isn't sync'd by  Dropbox  until  Thunderbird closes
# <dot>parentlock  seems to be a relic
if ( ! (Get-Process thunderbird -ErrorAction SilentlyContinue) ) {
  if ( test-path "$Thb\Win10ProLock" ) {
    ri $Thb\Win10ProLock
    toast -AppLogo C:\MT\chrome\icons\default\messengerWindow.ico -Text "Thunderbird", 'removed Win10ProLock'
  }
}

