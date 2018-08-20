set nolist nonumber norelativenumber
match none

nmap <buffer> @ <Plug>TarmacSearch
nnoremap <silent> <Plug>TarmacSearch :<C-U>call <SID>TSearch()<CR>
function! s:TSearch()
	let l:line = getline('.')
	let l:search = matchstr(l:line, '\v\s*\d+\s+tic ES\s+\(\0*\zs\w+:\ze')
	execute "normal! 0/".l:search."\<cr>"
	let @/ = l:search
	set hlsearch
endfunction

