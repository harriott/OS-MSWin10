# vim: fdl=1:

# little script to discover commands on system

"vim: ft=build nowrap tw=0:" > $machine\allCommands.log
'this file made by $MSwin10\getAllCommands.ps1' >> $machine\allCommands.log
"" >> $machine\allCommands.log
$cts = 'Alias','Application','Cmdlet','ExternalScript','Function'
foreach ($ct in $cts) {
  "# $ct" >> $machine\allCommands.log
  Get-Command -CommandType $ct | Format-Table -Property Name, Version, Source >> $machine\allCommands.log
}

