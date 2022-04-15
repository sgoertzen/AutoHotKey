#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#MaxThreadsPerHotkey 3

F4::
Hitting := !Hitting
Loop
{
	If (!Hitting)
		Break
	Click
	Sleep 500 ; Make this number higher for slower clicks, lower for faster.
}
return

F6::
Jumping := !Jumping
Loop
{
	If (!Jumping)
		Break
	Send, {w}
	Sleep 700 ; Make this number higher for slower clicks, lower for faster.
}
return

F7::
Click Down Right
return

F8::
Click Up Right
return

F9::
Firing := !Firing
Loop
{
	If (!Firing)
		Break
	Click Down Left
	Sleep 2000
	Click Up Left
	Sleep 1500
}
return