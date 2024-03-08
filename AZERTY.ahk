
; Joseph Harriott - AutoHotkey - ven. 08 mars 2024

; $MSWin10\AZERTY.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"

; ² (mapped in Vim's insert mode) I can't get to work with any modifier
!é::SendText "~" ; alt+é = tilde
!è::SendText "``" ; alt+è = back-tick

; environment variables don't work
#!a::Run "C:\Users\jharr\AppData\Roaming\AltSnap\AltSnap.exe" ; win+alt+a - open AltSnap
#!e::Run "msedge.exe" ; win+alt+e - open Edge
#!i::Run "C:\Vim\vim91\gvim.exe" ; win+alt+i - open gVim
#!k::Run "C:\Program Files\KeePassXC\KeePassXC.exe" ; win+alt+k - open KeePassXC
#!m::Run "C:\Emacs\emacs-28.1\bin\runemacs.exe" ; win+alt+m - open Emacs
#!p::Run "pwsh -wd ~" ; win+alt+p - PowerShell
#!v::Run "C:\Program Files\Everything\Everything.exe" ; win+alt+v - open Everything

#!t::Run "pwsh -nop -w minimized -f C:\MT-runSafely.ps1"
; - win+alt+t = Mozilla Thunderbird
#^t::{
	if WinExist("Thunderbird") {
		WinClose "Thunderbird"
	} else {
		Run "pwsh -nop -w minimized -f C:\MT-clearParentLock.ps1"
	}
} ; win+ctrl+t  closes MT

