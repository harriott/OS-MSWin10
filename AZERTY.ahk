
; Joseph Harriott - AutoHotkey - lun. 04 mars 2024

; $MSWin10\AZERTY.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"

; ² (mapped in Vim's insert mode) I can't get to work with any modifier
!é::SendText "~" ; alt+é = tilde
!è::SendText "``" ; alt+è = back-tick

#!i::Run "C:\Vim\vim91\gvim.exe" ; win+alt+i - open gVim
#!e::Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" ; win+alt+e - open Edge
#!k::Run "C:\Program Files\KeePassXC\KeePassXC.exe" ; win+alt+k - open KeePassXC
#!m::Run "C:\Emacs\emacs-28.1\bin\runemacs.exe" ; win+alt+m - open Emacs
#!v::Run "C:\Program Files\Everything\Everything.exe" ; win+alt+v - open Everything

#!t::Run "pwsh -NoProfile -WindowStyle Minimized -File C:\MT-runSafely.ps1"
; - win+alt+t = Mozilla Thunderbird
#^t::{
	if WinExist("Thunderbird") {
		WinClose "Thunderbird"
	} else {
		Run "pwsh -NoProfile -WindowStyle Minimized -File C:\MT-clearParentLock.ps1"
	}
} ; win+ctrl+t  closes MT

