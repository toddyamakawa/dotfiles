
syntax on " Enable syntax highlighting

set t_Co=256 " Terminal supports 256 colors

" Show tab characters and off-screen text indicator
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" UTF-8 support
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

set virtualedit=block
set number         " Show line number
set relativenumber " Show relative line number
set showmatch      " Show matching parantheses
set foldcolumn=3   " Show columns for folds

" Highlight current line
"TODO: Make CursorLine change color for insert mode
set cursorline
"autocmd InsertEnter * highlight CursorLine guifg=something
"autocmd InsertLeave * highlight CursorLine guifg=something

" Favorite Windows gvim font
set guifont=consolas

