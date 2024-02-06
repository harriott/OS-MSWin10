
; Joseph Harriott - AutoHotkey - Tue 06 Feb 2024

; $MSwin10\mb-HPEB840G362\user\jo.ahk

; Reload if changed!

; move a Shortcut of this script into
; "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Startup"

; CapsLock off on Esc
; -------------------
; Copied from  http://vim.wikia.com/wiki/Map_caps_lock_to_escape_in_Windows
; "The following AutoHotkey script will turn off CapsLock and generate Escape when Esc is pressed:"
; Esc::
; SetCapsLockState, off
; Suspend On
; Send, {ESC}
; Suspend Off
; return

#!i::Run "C:\Vim\vim91\gvim.exe" ; win+alt+i - open gVim
#!e::Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" ; win+alt+e - open Edge
#!v::Run "C:\Program Files\Everything\Everything.exe" ; win+alt+v - open Everything

