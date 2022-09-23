
# #region & #endregion create folding blocks if Peter Provost's vim-ps1 is installed

# Joseph Harriott, Wed 03 Aug 2022

# Windows Explorer Preview pane

$reply = Read-Host '- .ahk? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.ahk
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.ahk -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.ahk
}

$reply = Read-Host '- .aux? '
if ($reply -eq 'y') {
  New-Item Registry::HKEY_CLASSES_ROOT\.aux
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.aux -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.aux
}

$reply = Read-Host '- .cls? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.cls
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.cls -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.cls
}

$reply = Read-Host '- .dw? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.dw
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.dw -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.dw
}

$reply = Read-Host '- .el? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.el
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.el -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.el
}

$reply = Read-Host '- .list? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.list
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.list -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.list
}

$reply = Read-Host '- .log? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.log
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.log -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.log
}

$reply = Read-Host '- .md? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.md
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.md -Name PerceivedType -Value text
  # nicely overridden by  PowerToys File Explorer
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.md
}

$reply = Read-Host '- .ps1? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.ps1
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.ps1 -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.ps1
}

$reply = Read-Host '- .sty? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.sty
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.sty -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.sty
}

$reply = Read-Host '- .tex? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.tex
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.tex -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.tex
}

$reply = Read-Host '- .vim? '
if ($reply -eq 'y') {
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.vim
  Set-ItemProperty Registry::HKEY_CLASSES_ROOT\.vim -Name PerceivedType -Value text
  Get-ItemProperty Registry::HKEY_CLASSES_ROOT\.vim
}

