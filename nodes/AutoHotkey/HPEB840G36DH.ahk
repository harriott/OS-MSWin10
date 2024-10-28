
; Joseph Harriott - AutoHotkey - lun 28 oct 2024

; $MSn\AutoHotkey\HPEB840G36DH.ahk

; Reload if changed!

; run as needed

; environment variables don't work

#!a::Run "C:\Users\deaur\AppData\Roaming\AltSnap\AltSnap.exe" ; win+alt+a - open AltSnap
#!p::Run "wt -d C:\Users\deaur" ; win+alt+p - PowerShell opened on $home

; 1366x768 screen
#!n::Run "C:\Program Files\Neovide\neovide.exe --grid 109x46" ; win+alt+n - open Neovide
#!o::Run "wt --pos 9,9 --size 108,54 -d C:\Users\deaur"
;  - win+alt+o - a terminal sized ($vfv/enter/gvimrc.vim) for neovim

#Include AZERTY.ahk

