
; Joseph Harriott - AutoHotkey - dim 14 juil 2024

; $MSn\AutoHotkey\HPEB840G36.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$HADR\Microsoft\Windows\Start Menu\Programs\Startup"

; environment variables don't work

#!a::Run "C:\Users\jharr\AppData\Roaming\AltSnap\AltSnap.exe" ; win+alt+a - open AltSnap
#!p::Run "wt -d C:\Users\jharr" ; win+alt+p - PowerShell opened on $home

; 1366x768 screen
#^e::{
	WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 1130,710
	Click ; on Enregister
    MouseMove 1164,437
    Sleep 500
	Click ; on Type de fichier drop-down
    MouseMove 1164,466
    Sleep 500
	Click ; on Image(*.jpg)
    MouseMove 1160,645
    Sleep 1000
	Click ; on Enregister
	WinRestore "HP Smart ahk_exe ApplicationFrameHost.exe"
} ; win+ctrl+e  after a scan, brings forward and saves as jpg
#!n::Run "C:\Program Files\Neovide\neovide.exe --grid 109x46" ; win+alt+n - open Neovide
#!o::Run "wt --pos 9,9 --size 108,54 -d C:\Users\jharr"
;  - win+alt+o - a terminal sized ($vfv/enter/gvimrc.vim) for neovim
#^x::{
	WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 1250,285
	Click ; on that tiny x
    MouseMove 30,65
    Sleep 1000
	Click ; on that big back arrow
	WinRestore "HP Smart ahk_exe ApplicationFrameHost.exe"
} ; win+ctrl+x  after saving, brings forward and returns to  Numériser  window

#Include AZERTY.ahk

