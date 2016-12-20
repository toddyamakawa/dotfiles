
" --- Start Syntax ---
if exists("b:current_syntax")
	finish
endif

" --- Keywords ---
hi def link uart_keywords Keyword
syntax keyword uart_keywords SVOS BOOTEDOK TEST COMPLETE
syntax match uart_keywords /\vCPU\d+/

" --- Timestamps ---
hi def link uart_timestamp Comment
syntax match uart_timestamp /\v^\s*\d+:/

" --- Strings ---
hi def link uart_string String
syntax region uart_string start=/"/ end=/"/ display oneline
syntax region uart_string start=/'/ end=/'/ display oneline

" --- End Syntax ---
let b:current_syntax = "uart"

