
; Joseph Harriott - AutoHotkey - ven 16 janv 2026

; $MSn\AutoHotkey\AZERTY-HPSmart.ahk
; #Include'd by
;  $MSn\AutoHotkey\HPEB840G37.ahk
;  $MSn\AutoHotkey\HPEB840G38.ahk

; 1920x1080 screen
#^e::{
    WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
    WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    MouseMove 1680,1012
    Click ; on Enregister
    MouseMove 1725,750
    Sleep 500
    Click ; on Type de fichier drop-down
    MouseMove 1725,780
    Sleep 500
    Click ; on Image(*.jpg)
    MouseMove 1720,956
    Sleep 1000
    Click ; on Enregister
    WinRestore "HP Smart ahk_exe ApplicationFrameHost.exe"
} ; win+ctrl+e  after a scan, brings forward and saves as jpg (works 250510)
#^x::{
    WinMaximize "HP Smart ahk_exe ApplicationFrameHost.exe"
    WinActivate "HP Smart ahk_exe ApplicationFrameHost.exe"
    ; MouseMove 907,275
    MouseMove 1794,588
    Click ; on that tiny x
    MouseMove 23,57
    Sleep 1000
    Click ; on that big back arrow
    WinRestore "HP Smart ahk_exe ApplicationFrameHost.exe"
} ; win+ctrl+x  after saving, brings forward and returns to  Numériser  window (works 250510)

