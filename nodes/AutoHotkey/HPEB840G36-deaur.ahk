
; Joseph Harriott - AutoHotkey - mar 21 oct 2025

; $MSn\AutoHotkey\HPEB840G36-deaur.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$HADR\Microsoft\Windows\Start Menu\Programs\Startup"
; then run as needed

; environment variables don't work

#!a::Run "C:\Users\deaur\AppData\Roaming\AltSnap\AltSnap.exe" ; win+alt+a - open AltSnap
#!p::Run "wt -d C:\Users\deaur" ; win+alt+p - PowerShell opened on $home

; 1366x768 screen
#!n::Run "C:\Program Files\Neovide\neovide.exe --grid 109x46" ; win+alt+n - open Neovide
#!o::Run "wt --pos 9,9 --size 108,54 -d C:\Users\deaur"
;  - win+alt+o - a terminal sized ($vfv/enter/gvimrc.vim) for neovim

#Include AZERTY.ahk

