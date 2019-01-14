
" Stuff from https://vimways.org/2018/transactions-pending/

" ==============================================================================
" LINE TEXT OBJECT
" ==============================================================================

" --- Inner-Line ---
" <c-u> clears command line
" normal! executes command
" g_ goes to last non-whitespace character
" ^ goes to first non-whitespace character
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" --- Arround-Line ---
xnoremap <silent> al :<c-u>normal! $v0<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>

