
augroup large_file
	" If file is over 10 MB disable swap files and ignore FileType events
	autocmd BufReadPre *
		\ if getfsize(expand("%")) > 10000000 |
			\ setlocal noswapfile eventignore+=FileType |
		\ endif
	" Always turn on syntax highlighting
	autocmd BufReadPost * silent set syntax=on
augroup END

