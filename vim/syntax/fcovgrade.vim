
" :help group

" --- Start Syntax ---
if exists("b:current_syntax")
	finish
endif


" --- Nothing ---
syn match fcovgrade_bin /\v^\s+\S+\s+\S+\s+\S/


" --- Keyword ---
hi def link fcovgrade_keyword Keyword
syn match fcovgrade_keyword "\v^Type:.*"
syn match fcovgrade_keyword "\v^\s+Coverpoint:.*"


" --- Type ---
"hi def link fcovgrade_type type
"syn match fcovgrade_type "\v^Type: "

" --- Function ---
hi def link fcovgrade_function Function
syn match fcovgrade_function ":\zs.*" containedin=fcovgrade_keyword

" --- Numbers ---
hi def link fcovgrade_number Number
syn match fcovgrade_number "\v<g[1-9]>" containedin=fcovgrade_bin

" --- Macro ---
hi def link fcovgrade_macro Macro
syn match fcovgrade_macro /\v^\s+[^: ]+ / containedin=fcovgrade_bin

" --- Comment ---
hi def link fcovgrade_comment Comment
" TODO: Figure out why this doesn't work
"syn match fcovgrade_comment /\v^\s+\S+\s+\S+\s+.+/ containedin=fcovgrade_bin


let b:current_syntax = "fcovgrade"

