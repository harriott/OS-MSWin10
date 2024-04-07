
# $MSwin10\mb\modules.ps1

# #=> 0 PS 0 PSGallery
# Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
# Set-PSRepository PSGallery -InstallationPolicy trusted

#=> 0 WPS 1 Microsoft.PowerShell.PSResourceGet
inmo microsoft.powershell.psresourceget

#=> 0 WPS 2 PowerShell Gallery
set-psrepository psgallery -installationpolicy trusted
set-psresourcerepository psgallery -trusted

#=> 1 modules
inmo burnttoast
inmo posh-git
inmo powercolorls
inmo powershell.chunks
inmo ps.checkmoduleupdates
inmo PSFzf
inmo psscripttools
inmo psscripttools
inmo pswritecolor
inmo recycle
inmo terminal-icons
inmo ZLocation

