augroup uart
	autocmd BufRead uart*.output* silent set filetype=uart
	autocmd BufRead uart*.log silent set filetype=uart
	autocmd BufRead uart*.op silent set filetype=uart
augroup END
