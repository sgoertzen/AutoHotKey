#SingleInstance Force
#MaxThreadsPerHotkey 2

^F4::
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
return


^X::
if KeepFishingRunning {
    ToolTip Fishing - Casting, A_ScreenWidth / 2, A_ScreenHeight * 8 / 10
    Click down
    sleep 2010
    Click up
    ToolTip Fishing - Waiting on bite, A_ScreenWidth / 2, A_ScreenHeight * 8 / 10
}
return

^F3::
if KeepFishingRunning {
    KeepFishingRunning := false
    ToolTip
    return
}
KeepFishingRunning := true

ToolTip Fishing - Press Control-X to cast, A_ScreenWidth / 2, A_ScreenHeight * 8 / 10
lastPull := A_TickCount
Loop 
{
    ; Search for yellow in the circle
	PixelSearch, x, y, A_ScreenWidth*2/5, 100, A_ScreenWidth*3/5, A_ScreenHeight-100, 0x28B4F4, 1, Fast
	if (errorLevel = 0)
	{
		idleTime := A_TickCount
		ToolTip Fishing - Fish hooked, A_ScreenWidth / 2, A_ScreenHeight * 8 / 10
		Click
	}
    ; Search for green on the fishing meter
	PixelSearch, x, y, A_ScreenWidth/4, 100, A_ScreenWidth*3/4, A_ScreenHeight-100, 0x9DDD00, 5, Fast ;found green 
	if (errorLevel = 0)
	{
		ToolTip Fishing - Pulling, A_ScreenWidth / 2, A_ScreenHeight * 8 / 10
		lastPull := A_TickCount
		if !GetKeyState("LButton")
			Click down
	} else {
        ; Search for orange on the fishing meter
			PixelSearch, x, y, A_ScreenWidth/4, 100, A_ScreenWidth*3/4, A_ScreenHeight-100, 0x2D8DFF, 5, Fast ;found orange
			if (errorLevel = 0)
			{
				ToolTip Fishing - Pulling, A_ScreenWidth / 2, A_ScreenHeight * 8 / 10
				lastPull := A_TickCount
				if !GetKeyState("LButton")
					Click down
			} else {
				if GetKeyState("LButton")
				{
					elapsedTime := A_TickCount - lastPull
					if (elapsedTime < 1500)
					{
						ToolTip Fishing - Releasing, A_ScreenWidth / 2, A_ScreenHeight * 8 / 10
						Click up
						sleep 1500
					}
				}
			}
			
	}
    
    if not KeepFishingRunning {
        break
    }
}
return