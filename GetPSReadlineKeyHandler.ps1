# vim: fdl=1:

# little script to list  PSReadLine's key bindings

$l = "$machLg\PSReadlineKeyHandler.log"
"vim: ft=build nowrap tw=0:" > $l
'this file made by $MSWin10\GetPSReadlineKeyHandler.ps1' >> $l
'%s/^\n\(^\u.*\)\n\(^=\+\)/\r# \1\r  \2/' >> $l
"" >> $l
Get-PSReadlineKeyHandler >> $l

