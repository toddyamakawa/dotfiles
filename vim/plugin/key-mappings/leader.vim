
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


" --- Visibility ---

" Toggle list/number with <Leader>n
nnoremap <Leader>n :set number! relativenumber! list!<CR>

" Toggle wrap
nnoremap <Leader>sw :set wrap!<CR>


" --- Editing ---

" Toggle expand tab
nnoremap <Leader><Tab> :set expandtab!<CR>

" Split up shell command into multiple lines
nnoremap <Leader>\ :s/\v\s+-/ \\\r\t-/g<Enter>

" Delete trailing whitespace
nnoremap <Leader>d$ :%s/\s\+$//g<Enter>
" Delete non-ASCII characters
nnoremap <Leader>dx :%s/[^\x00-\x7F]//g<Enter>
" Delete carriage returns
nnoremap <Leader>d<Enter> :%s/\r//g<Enter>



" --- Miscellaneous ---

" Backup <Enter> key because <Enter> is mapped to :
nnoremap <Leader><Enter> <Enter>
vnoremap <Leader><Enter> <Enter>


" --- .vimrc ---
" Don't really use these anymore
"nnoremap <Leader>vi :e $MYVIMRC<Enter>
"nnoremap <Leader>vs :source $MYVIMRC<Enter>

