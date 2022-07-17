
; Joseph Harriott - Tue 24 May 2022

; $MSwin10\jo.ahk

; move a Shortcut of this script into
; "$Env:AppData\Microsoft\Windows\Start Menu\Programs\Start-up"

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

; Win+Alt+i - open gVim
; ---------------------
#!i::
Run C:\Vim\vim82\gvim.exe
Return

; Win+Alt+e - open Edge
; ---------------------
#!e::
Run "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
Return

; Win+Alt+k - open KeePassXC
; ---------------------
#!k::
Run "C:\Program Files\KeePassXC\KeePassXC.exe"
Return

; Win+Alt+t - open Thunderbird safely
; -----------------------------------
#!t::
Run pwsh -NoProfile -WindowStyle Minimized -File C:\MT-runSafely.ps1
Return

; Win+Alt+v - open Everything
; ---------------------------
#!v::
Run "C:\Program Files\Everything\Everything.exe"
Return

