
" :help group

" --- Start Syntax ---
if exists("b:current_syntax")
	finish
endif

" --- Macros ---
hi def link simlog_macro Macro
syn match simlog_macro /\v<ISSCMP>/

" --- Keywords ---
hi def link simlog_keywords Keyword
syn match simlog_keywords /\v.*instr_cnt.*/
syn match simlog_keywords /\v.*Call Stack.*/

" --- Errors ---
hi def link simlog_error Error
syn match simlog_error /\v.*FATAL.*/

" --- Comment ---
hi def link simlog_comment Comment
"syn region simlog_comment display oneline start='\v%(^|\s)#' end='$'

" --- End Syntax ---
let b:current_syntax = "simlog"

