
" vi: filetype=vim

" --- Start Syntax ---
if exists("b:current_syntax")
	finish
endif

" --- Keywords ---
hi def link uart_keywords Keyword
syn match uart_keywords /\v.*SVOS.*/
syn match uart_keywords /\v.*CPU\d+.*/

" --- Errors ---
hi def link uart_error Error
syn match uart_error /\v.*<[Pp]anic>.*/
syn match uart_error /\v.*<[Ff]ault>.*/

" --- Timestamps ---
" Highlight timestamps as comments
hi def link uart_ts Comment
syn region uart_ts start=/\v^\s*\d/ end=/:/ contains=uart_ts_ms
" Highlight most significant digits as 'todo'
hi def link uart_ts_ms Todo
syn match uart_ts_ms /\v^\s*\d{,3}\ze(\d{3})+:/ contained

" --- Strings ---
hi def link uart_string String
syn region uart_string start=/"/ end=/"/ display oneline
syn region uart_string start=/'/ end=/'/ display oneline

" --- End Syntax ---
let b:current_syntax = "uart"

