
; Joseph Harriott - AutoHotkey - dim 14 juil 2024

; $MSWin10\AutoHotkey\HPEB840G37.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$HADR\Microsoft\Windows\Start Menu\Programs\Startup"

; environment variables don't work

#!a::Run "C:\Users\jharr\AppData\Roaming\AltSnap\AltSnap.exe" ; win+alt+a - open AltSnap
#!p::Run "wt -d C:\Users\jharr" ; win+alt+p - PowerShell opened on $home

; 1920x1080 screen
#^e::{
	WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 1686,1020
	Click ; on Enregister
    MouseMove 1725,750
    Sleep 500
	Click ; on Type de fichier drop-down
    MouseMove 1725,780
    Sleep 500
	Click ; on Image(*.jpg)
    MouseMove 1720,956
    Sleep 1000
	Click ; on Enregister
	WinRestore "HP Smart ahk_exe ApplicationFrameHost.exe"
} ; win+ctrl+e  after a scan, brings forward and saves as jpg
#!n::Run "C:\Program Files\Neovide\neovide.exe --grid 109x62" ; win+alt+n - open Neovide
#!o::Run "wt --pos 9,9 --size 108,69 -d C:\Users\jharr"
; - win+alt+o - a terminal sized ($vfv/enter/gvimrc.vim) for neovim
#^x::{
	WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    ; MouseMove 905,310
    MouseMove 1804,598
	Click ; on that tiny x
    MouseMove 30,55
    Sleep 1000
	Click ; on that big back arrow
    MouseMove 990,670 ; ready mouse on Numériser button
	WinRestore "HP Smart ahk_exe ApplicationFrameHost.exe"
} ; win+ctrl+x  after saving, brings forward and returns to  Numériser  window

#Include AZERTY.ahk

