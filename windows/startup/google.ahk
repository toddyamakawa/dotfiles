
#SingleInstance, Force

; Initialize Links
GOOGLE_LINK    := "http://www.google.com/search?hl=en&q="

; --- Search with Control + Space ---
^space::
Gui, Destroy
Gui, Add, Text  , x10  y13, Search
Gui, Add, Edit  , x50  y10 w215 h21 vsearch, %search%
Gui, Add, Button, x215 y35 w50      gSearch    Default           , &Search
Gui, Show,, Search
return

Search:
Gui, Submit
Gui, Destroy
link := GOOGLE_LINK    . RegExReplace(search, "(^\s+|\s+$)")
MsgBox %link%
Run, %link%
Return


