# vim: set fdl=2:

# $MSWin10\build\PSmodules.ps1

# #=> 0 WPS 0 PowerShell Gallery
# set-psrepository PSGallery -installationpolicy trusted  # brings in  nuget

# #=> 0 AWPS 1 Microsoft.PowerShell.PSResourceGet
# inmo microsoft.powershell.psresourceget  # providing  isres

# #=> 0 AWPS 1 update PowerShellGet
# inmo PowerShellGet -force  # adds to  $CPF\WindowsPowerShell\Modules\PowerShellGet

# #=> 1 PS 0 PowerShell Gallery
# Set-PSResouRcerepository PSGallery -trusted; Get-PSResourceRepository

# #=> 1 PS 1 Microsoft.PowerShell.PSResourceGet
# inmo microsoft.powershell.psresourceget -Force
# # might be enough to  isres Microsoft.PowerShell.PSResourceGet

#=> 1 WPS - PowerShell Gallery
Set-PSResouRcerepository PSGallery -trusted; Get-PSResourceRepository

#=> 2 PS/WPS - modules 0 install
isres BurntToast
isres Pansies
isres Posh-Git
isres PowerColorLS
isres powershell.chunks
isres PSCalendar
isres ps.checkModuleUpdates
isres PSFzf
isres PSWriteColor
isres Recycle
isres Terminal-Icons
# isres ZLocation

#=> 2 PS/WPS - modules 1 update 1st
isres PSReadLine
isres PSScriptTools

#=> 2 PS/WPS - modules 2 update subsequent
cmu  # (in PS, throws some errors) lists, then provides an update command at end

# upmo Microsoft.PowerShell.PSResourceGet

# #==> Update-PSResource
# # doesn't remove the old version
# udres PSFzf
# udres PSReadLine
# udres PSScriptTools
# udres ThreadJob

#=> 2 PS/WPS - modules 3 remove
# delete from
#  $HOME\Documents\PowerShell\Modules
#  $HOME\Documents\WindowsPowerShell\Modules

