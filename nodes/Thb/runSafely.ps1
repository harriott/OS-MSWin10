# vim: fdl=1:

# Joseph Harriott - jeu 18 juil 2024

# run Mozilla Thunderbird safely from profile shared on Dropbox
# -------------------------------------------------------------
# for  $MSn\AutoHotkey\AZERTY.ahk
#  APS> syli $MSn\Thb\runSafely.ps1 C:\MT-runSafely.ps1
#  bat C:\MT-runSafely.ps1
#  csl C:\MT-runSafely.ps1

# Test this script:
#  ni -Path "$Drpbx\JH\Thb-dr" -name 'linuxlock'
#  $Env:Computername > $Drpbx\JH\Thb-dr\linuxlock
#  gc $Drpbx\JH\Thb-dr\linuxlock
#  pwsh -nop -w minimized -f C:\MT-runSafely.ps1

$Cn = $Env:Computername
$Drpbx = "D:\Dropbox"
$Thb = "$Drpbx\JH\Thb-dr"
$llf = "$Thb\linuxlock"; if ( test-path $llf ) { $h = gc $llf }
$Wlf = "$Thb\Win10ProLock"; if ( test-path $Wlf ) { $h = gc $Wlf }
. C:\MT-tT.ps1
if ( $h -and $h -ne $Cn ) { tT "locked to $h" }
else {
  if ( gci -r $Thb | ? Name -match ".+'s conflicted copy .+| \(Copie en conflit de " )
    { tT 'Dropbox conflicts in $Thb' }
  else { echo $Cn > $Wlf  # noting that Thunderbird is launched here
    start thunderbird } # thunderbird.exe  must be in path
}

