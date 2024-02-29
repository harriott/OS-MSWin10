
; Joseph Harriott - AutoHotkey - Tue 06 Feb 2024

; $MSwin10\mb-HPEB840G362\user\jo.ahk

; Reload if changed!

; move a Shortcut of this script into
; "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"

#!i::Run "C:\Vim\vim91\gvim.exe" ; win+alt+i - open gVim
#!e::Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" ; win+alt+e - open Edge
#!k::Run "C:\Program Files\KeePassXC\KeePassXC.exe" ; win+alt+k - open KeePassXC
#!m::Run "C:\Emacs\emacs-28.1\bin\runemacs.exe" ; win+alt+m - open Emacs
#!t::Run "pwsh -NoProfile -WindowStyle Minimized -File C:\MT-runSafely.ps1"
#!v::Run "C:\Program Files\Everything\Everything.exe" ; win+alt+v - open Everything

Esc::
	{
		SetCapsLockState "off"
		Suspend
		Send "{ESC}"
		Suspend
	}

; F1:: MsgBox "test message", "AHK message box", "icon!"

