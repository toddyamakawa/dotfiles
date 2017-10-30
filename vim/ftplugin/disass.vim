set nolist nonumber norelativenumber
match none

nmap <buffer> @ <Plug>DisassSearch
nnoremap <silent> <Plug>DisassSearch :<C-U>call <SID>DSearch()<CR>
function! s:DSearch()
	let l:line = getline('.')
	let l:search = matchstr(l:line, '\v\s*0x\zs[0-9a-f]+:\ze')
	execute "normal! 0/".l:search."\<cr>"
	let @/ = l:search
	set hlsearch
endfunction

