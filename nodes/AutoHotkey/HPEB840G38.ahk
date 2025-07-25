
; Joseph Harriott - AutoHotkey - jeu 25 juil 2024

; $MSn\AutoHotkey\HPEB840G38.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$HADR\Microsoft\Windows\Start Menu\Programs\Startup"

; environment variables don't work

; fn+f5/f6 not dimming/brightening screen
SC112::MsgBox ThisHotkey " was pressed - use win+a for brightness down" ; fn+f7
SC117::MsgBox ThisHotkey " was pressed - use win+a for brightness up" ; fn+f6

#!a::{
	ProcessClose "AltSnap.exe"
	Run "C:\Users\jnbh\AppData\Roaming\AltSnap\AltSnap.exe"
} ; win+alt+a - open AltSnap
#!p::Run "wt -d C:\Users\jnbh" ; win+alt+p - PowerShell opened on $home

; 1920x1080 screen
#^e::{
	WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 1817,1012
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
} ; win+ctrl+e  after a scan, brings forward and saves as jpg (works 250510)
#!n::Run "C:\Program Files\Neovide\neovide.exe --grid 109x62" ; win+alt+n - open Neovide
#!o::Run "wt --pos 9,9 --size 106,69 -d C:\Users\jnbh"
; - win+alt+o - a terminal sized ($vfv/enter/gvimrc.vim) for neovim
#^x::{
	WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    ; MouseMove 907,275
    MouseMove 1787,588
	Click ; on that tiny x
    MouseMove 30,55
    Sleep 1000
	Click ; on that big back arrow
    MouseMove 990,670 ; ready mouse on Numériser button
	WinRestore "HP Smart ahk_exe ApplicationFrameHost.exe"
} ; win+ctrl+x  after saving, brings forward and returns to  Numériser  window (works 250510)

#Include AZERTY.ahk

