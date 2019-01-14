
" Stuff from https://vimways.org/2018/transactions-pending/

" ==============================================================================
" NUMBER TEXT OBJECT
" ==============================================================================

" Regex to match number objects
let s:regex_numbers = ['0b[01]\+', '0x\x\+', '\d\+']


" --- Functions ---
function s:InNumber()

	let l:magic = &magic
	let l:line_num = line('.')
	let l:pattern = join(s:regex_numbers, '\|')

	set magic

	" Move cursor to end of number, else return
	if(!search(l:pattern, 'ce', l:line_num))
		return
	endif

	" Visually select to beginning of number
	normal! v
	call search(l:pattern, 'cb', l:line_num)

	" Restore magic
	let &magic = l:magic
endfunction


function s:AroundNumber()

	let l:magic = &magic
	let l:line_num = line('.')
	let l:pattern = join(s:regex_numbers, '\|')

	" Move cursor to end of number, else return
	if(!search(l:pattern, 'ce', l:line_num))
		return
	endif

	" Move cursor to end of whitespace
	call search('\%'.(virtcol('.')+1).'v\s*', 'ce', l:line_num)

	" Visually select to beginning of number
	normal! v
	call search(l:pattern, 'cb', l:line_num)

	" Move cursor to beginning of whitespace
	call search('\s*'.virtcol('.').'v', 'b', l:line_num)

	" Restore magic
	let &magic = l:magic
endfunction


" --- Key Mappings ---

" in-number
xnoremap in :<c-u>call <sid>InNumber()<cr>
onoremap in :<c-u>call <sid>InNumber()<cr>

" around-number
xnoremap an :<c-u>call <sid>AroundNumber()<cr>
onoremap an :<c-u>call <sid>AroundNumber()<cr>

