#Requires AutoHotkey v2.0
#SingleInstance Force

jumping := false
SetKeyDelay(0, 25)

Notify(msg) {
    CoordMode("ToolTip", "Screen")
    hwnd := ToolTip(msg, 0, 0)  ; draw once to measure its size
    WinGetPos(, , &w, &h, hwnd)
    ToolTip(msg, (A_ScreenWidth - w) // 2, (A_ScreenHeight - h) // 2)
    SetTimer(() => ToolTip(), -1500)
}

*F3:: {
    global jumping
    jumping := !jumping
    Notify(jumping ? "Jumping started" : "Jumping stopped")
    if jumping
        SetTimer(JumpLoop, -1)
}

JumpLoop() {
    global jumping
    while jumping {
        Loop 5 {
            if !jumping
                return
            SendEvent("{Space}")
            Sleep 150
        }
        ; Sleep 2 seconds in small slices so F3 cancels promptly
        Loop 20 {
            if !jumping
                return
            Sleep 100
        }
    }
}

running := false

*F4:: {  ; wildcard so it still fires while Shift is held by RunLoop
    global running
    running := !running
    Notify(running ? "Running started" : "Running stopped")

    if running
        SetTimer(RunLoop, -1)
}

RunLoop() {
    global running
    while running {
        Loop {
            Send "{Shift down}{w down}"
            Sleep 3000
            Send "{w up}{Shift up}"

            Loop 30 {
               if !running
                    return
                Sleep 100
            }
        }
    }
}

swinging := false

*F5:: {  ; wildcard so it still fires while Shift is held by RunLoop
    global swinging
    swinging := !swinging
    Notify(swinging ? "Swinging started" : "Swinging stopped")

    if swinging
        SetTimer(SwingLoop, -1)
}

SwingLoop() {
    global swinging
    while swinging {
        Loop {
            ; Games often miss instant down/up pairs, so hold the button briefly
            SendEvent("{LButton down}")
            Sleep 50
            SendEvent("{LButton up}")
            if !swinging
                return
            Sleep 200
        }
    }
}

*F6:: {
    static held := false
    if held := !held
        Click("right down")
    else
        Click("right up")
}