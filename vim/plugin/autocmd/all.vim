
" --- autocmd Group for All Files ---
augroup ALL

	" Highlight most significant digits of large numbers
	" 1 12 123 1234 12345 123456 1234567 12345678 123456789 1234567890
	"hi def link big_num Delimiter
	"syn match big_num /\v<\zs\d{1,3}\ze(\d{3}){2,}>/
	autocmd BufRead * match Delimiter /\v<\zs\d{1,3}\ze(\d{3}){2,}>/

	" Highlight column 81 and trailing whitespace
	"autocmd BufRead * 2match SpellBad /\v\%81v.\|\s\+$/

	" Highlight trailing whitespace
	autocmd BufRead * 2match SpellBad /\v\s+$/

	" Disable comment formatting
	autocmd BufNewFile,BufRead * set formatoptions-=cro

	" Automatically remove trailing whitespace
	autocmd BufWritePre * silent call StripTrailingWhitespace()

	" Automatically add +x permissions
	autocmd BufWritePre * if filereadable(expand("%")) &&  getline(1) =~ "^#!.*/bin/" | silent execute "!chmod +x %" | endif

augroup END

