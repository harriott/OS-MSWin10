
; Joseph Harriott - AutoHotkey - Tue 06 Feb 2024

; $MSwin10\mb-T430i73520M\user\jo.ahk

; Reload if changed!

; move a Shortcut of this script into
; "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"

; CapsLock off on Esc
; -------------------
; Copied from  http://vim.wikia.com/wiki/Map_caps_lock_to_escape_in_Windows
; "The following AutoHotkey script will turn off CapsLock and generate Escape when Esc is pressed:"
Esc::
SetCapsLockState, off
Suspend On
Send, {ESC}
Suspend Off
return

; win+alt+k - open KeePassXC
; ---------------------
#!k::
Run "C:\Program Files\KeePassXC\KeePassXC.exe"
Return

; win+alt+m - open Emacs
; -----------------------------------
#!m::
Run C:\Emacs\emacs-28.1\bin\runemacs.exe
Return

; win+alt+t - open Thunderbird safely
; -----------------------------------
#!t::
Run pwsh -NoProfile -WindowStyle Minimized -File C:\MT-runSafely.ps1
Return

