#MaxThreadsPerHotkey 2
F2::
if KeepMiningRunning  ; This means an underlying thread is already running the loop below.
{
    KeepMiningRunning := false  ; Signal that thread's loop to stop.
    return  ; End this thread so that the one underneath will resume and see the change made by the line above.
}
; Otherwise:
KeepMiningRunning := true

; Wiggle so I know the script started
Send a
Sleep, 250
Send f
Sleep 250
Counter = 0

Loop
{
    Send, {space}
    Random, rand, 1000, 3000
    Sleep, rand
    
    ; Every few loops, move so it doesn't time me out
    If Counter >  10 
    {
        Send e 
        Sleep,  800
        Send d
        Counter = 0
    }
    Counter++

    if not KeepMiningRunning  ; The user signaled the loop to stop by pressing Win-Z again.
        break  ; Break out of this loop.
}
KeepMiningRunning := false  ; Reset in preparation for the next press of this hotkey.
return

F1::
if KeepWaterRunning {
    KeepWaterRunning := false
    ToolTip
    return
}

KeepWaterRunning := true

Loop {
    ToolTip Water, A_ScreenWidth / 2, A_ScreenHeight * 8 / 10
    Send, {space}
    Random, rand, 4100, 4 400
    Sleep, rand
    if not KeepWaterRunning {
        break
    }
}