#Requires AutoHotkey v2.0
#SingleInstance Force

jumping := false
SetKeyDelay(0, 25)

F3:: {
    global jumping
    jumping := !jumping
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

F4:: {
    global running
    running := !running
    
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