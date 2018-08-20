
" :help group

" --- Start Syntax ---
if exists("b:current_syntax")
	finish
endif


" --- Hexadecimal ---
hi def link simlog_number Number
" TODO: Figure out how to underline parts of numbers without ruining color
"hi simlog_number ctermbg=NONE ctermfg=NONE cterm=underline guibg=NONE guifg=NONE gui=underline
syn match simlog_number /\v<0x[_0-9a-fA-F]+>/ containedin=simlog_keyword
syn match simlog_number /\v<[0-9]{3,}>/ containedin=simlog_keyword


" --- Macros ---
hi def link simlog_macro Macro
syn match simlog_macro /\v<ISSCMP>/ containedin=simlog_keyword
syn match simlog_macro /\v<instr_cnt>/ containedin=simlog_keyword


" --- Keywords ---
hi def link simlog_keyword Keyword
syn match simlog_keyword /\v.*instr_cnt.*/
syn match simlog_keyword /\v.*Call Stack.*/


" --- Underlined ---
hi def link simlog_special Special
syn match simlog_special /\v.*FORCE PASS.*/ containedin=simlog_comment


" --- Functions ---
hi def link simlog_function Function

" Fetch generator
syn match simlog_function /\v: ifid_maop/

" Decode queue write
syn match simlog_function /\vIF_ID:.*/

" ID to CT
syn match simlog_function /\vID_CT:.*/

" ID to RN
syn match simlog_function /\vID_RN:.*/

" RN to IS
syn match simlog_function /\vRN_IS( \(RD\))?:.*/

" Testbench handles rename
syn match simlog_function /\vhandling rename.*/
"syn match simlog_function /\vgetting uniq_id.*/

" IS to EX
syn match simlog_function /\vIS_[0-9A-Z]+:.*/

" Resolve instruction
syn match simlog_function /\v<[0-9A-Z]+_CT:.*/

"
syn match simlog_function /\vCT_CMT uid:.*/

"
syn match simlog_function /\v<[0-9A-Z]+_IS:.*/


" --- Errors ---
hi def link simlog_error Error
syn match simlog_error /\v.*FATAL.*/ containedin=simlog_comment
syn match simlog_error /\v\*\* Fatal.*/ containedin=simlog_comment
syn match simlog_error /\v\*\* Error.*/ containedin=simlog_comment
syn match simlog_error /\v\[ARM_FAILMSG\].*/ containedin=simlog_comment
syn match simlog_error /\v\[CHECK_FOR_X\].*/ containedin=simlog_comment


" --- Comment ---
hi def link simlog_comment Comment
syn match simlog_comment /\v^# \*[^*][^:]+:/
syn match simlog_comment /\v^# \/\/.*/
"syn region simlog_comment display oneline start='\v%(^|\s)#' end='$'


" --- End Syntax ---
let b:current_syntax = "simlog"

