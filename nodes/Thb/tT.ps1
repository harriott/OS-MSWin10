# vim: fdl=1:

# Joseph Harriott - lun 27 janv 2025
# APS> syli $MSn\Thb\tT.ps1 C:\MT-tT.ps1
#  then sourced by  $MSn\Thb\clearWin10ProLock.ps1  &  $MSn\Thb\runSafely.ps1

function tT { toast -AppLogo "$env:programfiles\Mozilla Thunderbird\chrome\icons\default\messengerWindow.ico" -Text "Thunderbird", $args[0] }

