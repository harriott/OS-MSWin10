
; Joseph Harriott - AutoHotkey - ven 16 janv 2026

; $MSn\AutoHotkey\HPEB840G37.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$HADR\Microsoft\Windows\Start Menu\Programs\Startup"

; environment variables don't work

#!a::Run "C:\Users\jharr\AppData\Roaming\AltSnap\AltSnap.exe -r" ; win+alt+a - open AltSnap
#!p::Run "wt -d C:\Users\jharr" ; win+alt+p - PowerShell opened on $home

#!n::Run "C:\Program Files\Neovide\neovide.exe --grid 109x62" ; win+alt+n - open Neovide
#!o::Run "wt --pos 9,9 --size 108,69 -d C:\Users\jharr"
; - win+alt+o - a terminal sized ($vfv/enter/gvimrc.vim) for neovim

#Include AZERTY.ahk
#Include AZERTY-HPSmart.ahk

