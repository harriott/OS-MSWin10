# vim: fdl=1:

# Joseph Harriott, mer 25 mars 2026

# $MSn/PS/Profile-PS.ps1
#  symlinked in  $MSn/set/2-PSProfile.ps1
#   then called by  $MSn/PS/Profile.ps1

#=> 0 system
function pro {
  Get-Process | sort ws -descending | select-object -first 39 ID,Name,WS,VM,PM,Handles,StartTime
  | ConvertTo-WPFGrid -Refresh -timeout 10 -Title "Top Processes"
} # throws up a window

