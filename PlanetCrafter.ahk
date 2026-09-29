#SingleInstance Force
#MaxThreadsPerHotkey 2

StayingAlive := false


ToolTip Ready, -1500, 900

F3::
if StayingAlive {
    StayingAlive := false
    ToolTip
    return
} 

LoopCounter := 0
StayingAlive := true

Loop {
    if (not StayingAlive)
    {
        break
    }
    ToolTip Staying Alive, -1500, 900

    ; Sleep for 1 second
    sleep 1000

    LoopCounter := LoopCounter + 1
    

    if (LoopCounter > 600)
    {
        ToolTip Eating food %LoopCounter%, -1500, 900
        
        Send, {tab}
        Sleep 500
        Click, 578 355 Right
        Sleep 500
        Click, 581 655 Right
        Sleep 500
        Send, {esc} 
        
        LoopCounter := 0
    }

}
Return