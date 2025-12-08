# vim: fdl=2:

# Joseph Harriott - ven 05 déc 2025

# remove my  $JHThb\Win10ProLock  if Thunderbird isn't running
# ----------------------------------------------------------
# for  $MSn\AutoHotkey\AZERTY.ahk
#  APS> syli $MSn\Thb\clearLocks.ps1 C:\MT-clearLocks.ps1
#   bat C:\MT-clearLocks.ps1
#   csl C:\MT-*

# Test:
#  $Cn > $JHThb\Win10ProLock
#  'other' > $JHThb\Win10ProLock
#  'dud' > $JHThb\parent.lock
#  & C:\MT-clearWin10ProLock.ps1

. ~\PSEnv.ps1
  # ls $JHThb\parent.lock  is kept in use by  Thunderbird
  #  and so isn't sync'd by  Dropbox  until  Thunderbird closes
  # <dot>parentlock  seems to be a relic
  if ( ! (Get-Process thunderbird -ErrorAction SilentlyContinue) ) {
    . C:\MT-tT.ps1
    if ( test-path "$RTh\jo\parent.lock" ) {
      ri $RTh\jo\parent.lock
      tT 'removed  $RTh\jo\parent.lock'
    }
    if ( test-path "$RTh\jo\Win10ProLock" ) {
      ri $RTh\jo\Win10ProLock
      tT 'removed  $RTh\jo\Win10ProLock'
    }
    if ( test-path "$JHThb\parent.lock" ) {
      ri $JHThb\parent.lock
      tT 'removed  $JHThb\parent.lock'
    }
    if ( test-path "$JHThb\Win10ProLock" ) {
      ri $JHThb\Win10ProLock
      tT 'removed  $JHThb\Win10ProLock'
    }
  }

