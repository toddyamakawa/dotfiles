augroup uart
	autocmd BufReadPost uart*.output* silent set filetype=uart
	autocmd BufReadPost uart*.log silent set filetype=uart
	autocmd BufReadPost uart*.op silent set filetype=uart
augroup END
