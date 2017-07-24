
" :help group

" --- Start Syntax ---
if exists("b:current_syntax")
	finish
endif

" --- Hexadecimal ---
hi def link uart_number Number
syn match uart_number /\v<[-.:0-9]+>/
syn match uart_number /\v<0x[0-9a-fA-F]+>/

" --- Keywords ---
hi def link uart_keywords Keyword
syn match uart_keywords /\v.*SVOS.*/
syn match uart_keywords /\v.*CPU\d+.*/
syn match uart_keywords /\v.*Kiwi+.*/
syn match uart_keywords /\v<Payload>.*<launched>/
syn match uart_keywords /\v<Payload>.*<terminated>/

" --- Errors ---
hi def link uart_error Error
syn match uart_error /\v.*<[Pp]anic>.*/
syn match uart_error /\v.*<[Ff]ault>.*/
syn match uart_error /\v\c<error>.*/

" --- Kernel Debug ---
hi def link uart_kernel_debug Macro
syn match uart_kernel_debug /\v.*calling\s+\w+\+.*/
syn match uart_kernel_debug /\v.*initcall\s+\w+\+.*/

" --- Timestamps ---
" Display timestamps as comments
hi def link uart_ts Comment
syn match uart_ts /\v^\s*\d+:/ contains=uart_ts_ms
" Highlight most significant digits as 'todo'
hi def link uart_ts_ms Todo
syn match uart_ts_ms /\v^\s*\d{,3}\ze(\d{3})+:/ contained

" --- Strings ---
hi def link uart_string String
syn region uart_string start=/"/ end=/"/ display oneline
syn region uart_string start=/'/ end=/'/ display oneline

" --- End Syntax ---
let b:current_syntax = "uart"

