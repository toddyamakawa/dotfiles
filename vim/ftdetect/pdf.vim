autocmd BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk -eol unix -q "%" -
autocmd BufReadPost *.pdf set nomodifiable
