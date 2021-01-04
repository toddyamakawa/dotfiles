
#NoTrayIcon
#SingleInstance, Force

; Shift-Windows-v to paste
;+#n::SendRaw %clipboard%

+#n::
;WinGetActiveTitle, Title
;WinGetClass, Title, %Title%
;MsgBox, The active window is "%Title%".
;if WinExist("ahk_exe Slack.exe")
	;WinActivate ahk_exe Slack.exe
;Return

; REVISIT: Figure out why GroupAdd doesn't work
;GroupAdd, SlackGroup, "ahk_exe Slack.exe"
;#IfWinActive, ahk_group SlackGroup

#IfWinActive, ahk_exe Slack.exe
^tab::SendInput, {F6}
^+tab::SendInput, +{F6}

