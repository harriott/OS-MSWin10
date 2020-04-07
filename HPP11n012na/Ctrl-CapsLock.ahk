; Fix for my 11-n012na failing left Ctrl key.

; Shortcut to the script in the Startup folder:
; C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup

CapsLock::Ctrl ; CapsLock assigned as a reliable Ctrl key (but lose mouse locating ring)
!CapsLock::Capslock ; Alt+CapsLock invokes CapsLock

; This gives the sometimes functioning key a relatively harmless use
LControl::CapsLock ; but it unfortunately turns AltGr into both Alt and CapsLock, so
<^>!4::
Send, ^!4
SetCapsLockState, off
return

