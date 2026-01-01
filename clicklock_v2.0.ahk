#Requires AutoHotkey v2.0
; Auto-execute as Admin to ensure it can "see" system tools
if !A_IsAdmin {
    Run('*RunAs "' A_ScriptFullPath '"')
    ExitApp
}

lock := false

; --- CRITICAL FIX FOR WINDOWS 7 SNIPPING TOOL ---
; This tells the script: If Snipping Tool is open, DO NOT run the code below.
#HotIf !WinExist("ahk_exe SnippingTool.exe")

; Middle button toggles the lock
MButton:: {
    global lock
    if lock {
        lock := false
        Send("{LButton up}") 
    } else {
        Send("{LButton down}") 
        lock := true
    }
}

; Intercept the click ONLY when Snipping Tool is NOT running
$LButton:: {
    global lock
    if lock {
        lock := false
        Send("{LButton up}")
    } else {
        ; Use Click Down/Up for better compatibility on Win7
        Click "Down"
        KeyWait "LButton"
        Click "Up"
    }
}

#HotIf ; Reset the condition