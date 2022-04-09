Loop,1
{
WinWait, Plants vs. Zombies, 
IfWinNotActive, Plants vs. Zombies, , WinActivate, Plants vs. Zombies, 
WinWaitActive, Plants vs. Zombies, 
MouseClick, left,  372,  15
Sleep, 100

-- Click Shop
MouseClick, left,  745,  85
Sleep, 2000

Loop,10
{
-- Purchase Fertzlizer
MouseClick, left,  473,  381
Sleep, 100
MouseClick, left,  312,  418
Sleep, 100
}

-- Click Go Back
MouseClick, left,  426,  580
Sleep, 100

Loop, 10
{
-- Feed Tree
MouseClick, left,  72,  71
Sleep, 100
MouseClick, left,  384,  294
Sleep, 2000
}
Sleep, 5000
}