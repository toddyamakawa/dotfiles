
" https://codeyarns.com/2014/05/05/how-to-highlight-current-file-in-nerdtree/


" Check if NERDTree is open
function! NERDTreeOpen()
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction


" Synchronize File with NERDTree
function! NERDTreeSync()
	if &modifiable && NERDTreeOpen() && strlen(expand("%")) > 0 && !&diff
		NERDTreeFind
		wincmd p
	endif
endfunction


" TODO: Figure out why this breaks things
"autocmd BufEnter * call NERDTreeSync()

