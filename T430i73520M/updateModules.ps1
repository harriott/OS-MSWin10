# vim: set fdl=1:

# Joseph Harriott
# update my modules

# Get-InstalledModule | Format-Table -Property Name; Get-Module

$Ms = @(

        ('posh-git', 'Installed'),
    ('PowerColorLS', 'Installed'),
   ('PowerShellGet',          ''),
           ('PSFzf', 'Installed'),
      ('PSReadLine',          ''),
  ('Terminal-Icons', 'Installed'),
       ('ZLocation', 'Installed'),
                ('',          '') # empty end

)

foreach ($M in $Ms) {
  if ($M[0]) {
    $vc = "(Get-"+$M[1]+"Module -Name "+$M[0]+" | select version | Format-Table -HideTableHeaders | Out-String).trim()"
    $v = iex $vc
    $M[0]+" $v -> $ov"
  }
}

