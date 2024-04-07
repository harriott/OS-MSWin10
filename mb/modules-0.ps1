
# $MSwin10\mb\modules.ps1

#=> AWPS PowerShellGet
as Administrator, install-packageprovider nuget -force  got me  nuget 2.8.5.208
as Administrator, update-module powershellget
as Administrator, install-module powershellget -force

#=> WPS 1 PowerShellGet
Microsoft.PowerShell.PSResourceGet''
install-module microsoft.powershell.psresourceget
set-psrepository psgallery -installationpolicy trusted
set-psresourcerepository psgallery -trusted
# build - WPS 1 modules
install-module burnttoast
install-module posh-git
install-module powercolorls
install-module ps.checkmoduleupdates
install-module psfzf
install-module psscripttools
install-module terminal-icons
