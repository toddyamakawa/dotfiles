
" --- User-Definend Colors ---
" White on Black
hi User1 ctermfg=7 ctermbg=0

" Green on Black
hi User2 ctermfg=2 ctermbg=0

" Yellow on Black
hi User3 ctermfg=3 ctermbg=0

" Red on Black
hi User4 ctermfg=1 ctermbg=0

" Blue on Black
hi User5 ctermfg=6 ctermbg=0

" White on Blue if Insert Mode
" White on Black if not Insert Mode
hi User9 ctermfg=7 ctermbg=0
au InsertEnter * hi User9 ctermfg=7 ctermbg=6
au InsertLeave * hi User9 ctermfg=7 ctermbg=0


" --- Left Status Line ---
set statusline=

" FileName
set statusline+=%9*%f

" ModifiedFlag
set statusline+=%4*%m


" --- Right Status Line ---
set statusline+=%1*%=

" CurrentLine/TotalLines
set statusline+=%6l%1*/%L

" ColumnNumber
set statusline+=,%-3c

" PercentFile
set statusline+=\ %3p%%

" FileType
set statusline+=\ %3*%y

