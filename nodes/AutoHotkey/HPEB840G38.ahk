
; Joseph Harriott - AutoHotkey - jeu 25 juil 2024

; $MSn\AutoHotkey\HPEB840G38.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$HADR\Microsoft\Windows\Start Menu\Programs\Startup"

; environment variables don't work

; fn+f5/f6 not dimming/brightening screen
SC112::MsgBox ThisHotkey " was pressed." ; fn+f5
SC117::MsgBox ThisHotkey " was pressed." ; fn+f6

#!a::Run "C:\Users\jnbh\AppData\Roaming\AltSnap\AltSnap.exe" ; win+alt+a - open AltSnap
#!p::Run "wt -d C:\Users\jnbh" ; win+alt+p - PowerShell opened on $home

; 1920x1080 screen
#^e::{
	WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 790,700
	Click ; on Enregister
    MouseMove 820,430
    Sleep 500
	Click ; on Type de fichier drop-down
    MouseMove 820,460
    Sleep 500
	Click ; on Image(*.jpg)
    MouseMove 820,630
    Sleep 1000
	Click ; on Enregister
	WinRestore "HP Smart ahk_exe ApplicationFrameHost.exe"
} ; win+ctrl+e  after a scan, brings forward and saves as jpg (works 240928)
#!n::Run "C:\Program Files\Neovide\neovide.exe --grid 109x62" ; win+alt+n - open Neovide
#!o::Run "wt --pos 9,9 --size 108,69 -d C:\Users\jnbh"
; - win+alt+o - a terminal sized ($vfv/enter/gvimrc.vim) for neovim
#^x::{
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    ; MouseMove 905,310
    MouseMove 907,275
	Click ; on that tiny x
    MouseMove 30,55
    Sleep 1000
	Click ; on that big back arrow
    MouseMove 990,670 ; ready mouse on Numériser button
} ; win+ctrl+x  after saving, brings forward and returns to  Numériser  window (works 240928)

#Include AZERTY.ahk

