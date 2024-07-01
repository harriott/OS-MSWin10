# vim: set fdl=1:

# & $MSwin10\mb\modules.ps1

# #=> 0 AWPS 0 PowerShell Gallery
# set-psrepository psgallery -installationpolicy trusted

# #=> 0 AWPS 1 Microsoft.PowerShell.PSResourceGet
# inmo microsoft.powershell.psresourceget  # brings in  nuget

# #=> 1 PS - PowerShell Gallery
# Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
# Set-PSRepository PSGallery -InstallationPolicy trusted

# #=> 1 WPS - PowerShell Gallery
# set-psresourcerepository psgallery -trusted; Get-PSResourceRepository

#=> 2 AWPS - modules
'BurntToast'; inmo burnttoast
'Posh-Git'; inmo posh-git
'PowerColorLS'; inmo powercolorls
'Powershell.Chunks'; inmo powershell.chunks
'ps.checkmoduleupdates'; inmo ps.checkmoduleupdates
'PSFzf'; inmo PSFzf
'PSScriptTools'; inmo psscripttools
'PSWriteColor'; inmo pswritecolor
'Recycle'; inmo recycle
'Terminal-Icons'; inmo terminal-icons
'ZLocation'; inmo ZLocation

