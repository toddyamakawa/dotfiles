
" ==============================================================================
" LEADER
" ==============================================================================

" Space is the best leader because it does the same thing as 'l' in normal mode
let mapleader="\<space>"
let g:mapleader="\<space>"


" --- Save/Quit ---
nnoremap <Leader>w :w!<Enter>
nnoremap <Leader>q :q!<Enter>
nnoremap <Leader>x :x!<Enter>


" --- Window Shortcuts ---

" Move between windows
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l

" Resize windows evenly
nnoremap <Leader>= <C-w>=


" --- .vimrc ---
" Don't really use these anymore
"nnoremap <Leader>vi :e $MYVIMRC<Enter>
"nnoremap <Leader>vs :source $MYVIMRC<Enter>

