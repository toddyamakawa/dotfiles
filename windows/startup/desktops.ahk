
#NoTrayIcon
#SingleInstance, Force

#Space::Send #{Tab}
#Tab::Send ^#{Right}
+#Tab::Send ^#{Left}

#Escape::
;WinGetActiveTitle wintitle, A
WinGetTitle process, ahk_exe
MsgBox "Title: %wintitle%"
MsgBox "Process: %process%"
Return

