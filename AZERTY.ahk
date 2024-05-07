
; Joseph Harriott - AutoHotkey - mar 23 avr 2024

; $MSWin10\AZERTY.ahk

; Reload if changed!

; move a Shortcut of this script into
;  "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"

; ² (mapped in Vim's insert mode) I can't get to work with any modifier
!é::SendText "~" ; alt+é = tilde (without delay)
!è::SendText "ê" ; alt+è = e circumflex
; § is available
ù::SendText "``"  ; ù = backtick
µ::SendText "^"  ; µ = circumflex
Ins::SetCapsLockState !GetKeyState("CapsLock", "T")  ; Ins = CapsLock

; environment variables don't work

#!a::Run "C:\Users\jharr\AppData\Roaming\AltSnap\AltSnap.exe" ; win+alt+a - open AltSnap
#!e::Run "msedge.exe" ; win+alt+e - open Edge
#!h::Reload ; win+alt+h - Reloads this file
#!i::Run "C:\Vim\vim91\gvim.exe" ; win+alt+i - open gVim
#!k::Run "C:\Program Files\KeePassXC\KeePassXC.exe" ; win+alt+k - open KeePassXC
#!m::Run "C:\Emacs\emacs-28.1\bin\runemacs.exe" ; win+alt+m - open Emacs
#!n::Run "wt --pos 9,9 --size 106,69 -d ~"
; - win+alt+n - a terminal sized ($vimfiles/vim/enter/gvimrc.vim) for neovim
#!p::Run "pwsh -wd ~" ; win+alt+p - PowerShell opened on $home
#!v::Run "C:\Program Files\Everything\Everything.exe" ; win+alt+v - open Everything
CapsLock::SendText "\"

#^e::{
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 790,700
	Click ; on Enregister
    MouseMove 820,430
    Sleep 500
	Click ; on Type de fichier drop-down
    MouseMove 820,460
    Sleep 500
	Click ; on Image(*.jpg)
    MouseMove 820,640
    Sleep 1000
	Click ; on Enregister
} ; win+ctrl+e  after a scan, brings forward and saves as jpg
#^s::{
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 960,700
	Click ; on Numériser
} ; win+ctrl+s  brings forward and scans
#^x::{
	WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 905,275
	Click ; on that tiny x
    MouseMove 30,55
    Sleep 1000
	Click ; on that big back arrow
    MouseMove 990,670 ; ready mouse on Numériser button
} ; win+ctrl+x  after saving, brings forward and returns to  Numériser  window
#!s::{
    SendEvent "^{Esc}"
    Sleep 1000
    Send "HP Smart"
    Sleep 1000
    SendEvent "{Enter}"
    Sleep 1000
    MouseMove 440,400
} ; win+alt+s  launches  HP Smart  and gets mouse ready on  Numériser  button

#!t::Run "pwsh -nop -w minimized -f C:\MT-runSafely.ps1"
; - win+alt+t = Mozilla Thunderbird
#^t::{
	if WinExist("ahk_exe thunderbird.exe") {
		WinClose "ahk_exe thunderbird.exe"
	} else {
		Run "pwsh -nop -w minimized -f C:\MT-clearParentLock.ps1"
	}
} ; win+ctrl+t  closes MT

