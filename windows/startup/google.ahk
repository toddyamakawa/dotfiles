
#SingleInstance, Force

; --- Search with Control + Space ---
^space::
Gui, +AlwaysOnTop
Gui, Add, Edit, x10  y10 w215 h20 vsearch, %search%
Gui, Add, Button, Hidden Default, OK
Gui, Show,, Search
Return

; Escape to Exit
GuiEscape:
Gui, Destroy
Return

; Enter to Search
ButtonOK:
Gui, Submit
Gui, Destroy
link := "http://www.google.com/search?hl=en&q=" . RegExReplace(search, "(^\s+|\s+$)")
Run, %link%
Return

