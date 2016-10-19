autocmd BufReadPre *.pdf set ro
autocmd BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk -eol unix -q "%" -
