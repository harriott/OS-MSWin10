# vim: fdl=1:

# little script to discover commands on system

$l = $MSWml\allCommands.log
"vim: ft=build nowrap tw=0:" > $l
'this file made by $MSWin10\getAllCommands.ps1' >> $l
'%s/ *$//|nohlsearch' >> $l
"" >> $l
$cts = 'Alias','Application','Cmdlet','ExternalScript','Function'
foreach ($ct in $cts) {
  "# $ct" >> $l
  Get-Command -CommandType $ct | Format-Table -Property Name, Version, Source >> $l
}

