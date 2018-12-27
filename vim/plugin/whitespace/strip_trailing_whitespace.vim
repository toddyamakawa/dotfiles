
" Function stolen shamelessly from:
" https://vimways.org/2018/from-vimrc-to-vim/
function StripTrailingWhitespace()
	if !&binary && &filetype != 'diff'
		normal! mz
		normal! Hmy
		%s/\s\+$//e
		normal! 'yz<CR>
		normal! `z
	endif
endfunction

