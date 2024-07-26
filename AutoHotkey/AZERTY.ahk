
; Joseph Harriott - AutoHotkey - dim 14 juil 2024

; $MSWin10\AutoHotkey\AZERTY.ahk
; #Include'd by  $MSWin10\AutoHotkey\HPEB840G36.ahk

; ² (mapped in Vim's insert mode) I can't get to work with any modifier
!é::SendText "~" ; alt+é = tilde (without delay)
!è::SendText "ê" ; alt+è = e circumflex
; § is available
ù::SendText "``"  ; ù = backtick
	!ù::SendText "û" ; alt+ù = u circumflex
µ::SendText "^"  ; µ = circumflex
Ins::SetCapsLockState !GetKeyState("CapsLock", "T")  ; Ins = CapsLock

#!e::Run "msedge.exe" ; win+alt+e - open Edge
#!h::Reload ; win+alt+h - Reloads this file
#!i::Run "C:\Vim\vim91\gvim.exe" ; win+alt+i - open gVim
#!k::Run "C:\Program Files\KeePassXC\KeePassXC.exe" ; win+alt+k - open KeePassXC
#!m::Run "C:\Emacs\emacs-28.1\bin\runemacs.exe" ; win+alt+m - open Emacs
#!v::Run "C:\Program Files\Everything\Everything.exe" ; win+alt+v - open Everything
CapsLock::SendText "\"

#^s::{
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 970,730
	Click ; on Numériser
} ; win+ctrl+s  brings forward and scans

#!t::Run "pwsh -nop -w minimized -f C:\MT-runSafely.ps1"
; - win+alt+t = Mozilla Thunderbird
#^t::{
	if WinExist("ahk_exe thunderbird.exe") {
		WinClose "ahk_exe thunderbird.exe"
	} else {
		Run "pwsh -nop -w minimized -f C:\MT-clearWin10ProLock.ps1"
	}
} ; win+ctrl+t  closes MT

