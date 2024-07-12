# vim: set fdl=1:

# & $MSwin10\mb\modules.ps1

# #=> 0 WPS 0 PowerShell Gallery
# set-psrepository psgallery -installationpolicy trusted  # brings in  nuget

# #=> 0 AWPS 1 Microsoft.PowerShell.PSResourceGet
# inmo microsoft.powershell.psresourceget  # providing  isres

# #=> 0 AWPS 1 update PowerShellGet
# inmo PowerShellGet -force  # adds to  C:\Program Files\WindowsPowerShell\Modules\PowerShellGet

# #=> 1 PS - PowerShell Gallery
# Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
# Set-PSRepository PSGallery -InstallationPolicy trusted

# #=> 1 WPS - PowerShell Gallery
# set-psresourcerepository psgallery -trusted; Get-PSResourceRepository

#=> 2 WPS - modules
# 'BurntToast'; isres burnttoast
'Posh-Git'; isres posh-git
'PowerColorLS'; isres powercolorls
'Powershell.Chunks'; isres powershell.chunks
'ps.checkmoduleupdates'; isres ps.checkmoduleupdates
'PSFzf'; isres PSFzf
'PSScriptTools'; isres psscripttools
'PSWriteColor'; isres pswritecolor
'Recycle'; isres recycle
'Terminal-Icons'; isres terminal-icons
'ZLocation'; isres ZLocation

