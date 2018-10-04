augroup tcl_filetype
	autocmd BufNewFile,BufRead *.do     set filetype=tcl
	autocmd BufNewFile,BufRead *.qel    set filetype=tcl
	autocmd BufNewFile,BufRead *.utf    set filetype=tcl
	autocmd BufNewFile,BufRead *.veloce set filetype=tcl
augroup END

augroup tcl_template
	autocmd BufNewFile *.tcl    0r ~/.vim/template/header.tcl
	autocmd BufNewFile *.do     0r ~/.vim/template/header.tcl
	autocmd BufNewFile *.qel    0r ~/.vim/template/header.tcl
	autocmd BufNewFile *.utf    0r ~/.vim/template/header.tcl
	autocmd BufNewFile *.veloce 0r ~/.vim/template/header.tcl
augroup END
