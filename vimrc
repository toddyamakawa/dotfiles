
" ==============
"    VIM-PLUG
" ==============

" --- Install ---
" :PlugInstall

" --- Setup ---
set nocompatible
filetype off

" --- Vim Plugins ---
call plug#begin('~/.vim/vim-plug')
	source ~/.vim/plug.vim
call plug#end()

" --- Enable Plugins ---
filetype indent plugin on


" ======================
"    GENERAL SETTINGS
" ======================
set history=50     " Save 50 command lines of history

" --- Set <Leader> to Space ---
let mapleader="\<space>"
let g:mapleader="\<space>"

" --- Command Line ---
nnoremap <Enter> :
vnoremap <Enter> :
autocmd CmdwinEnter * nnoremap <buffer> <Enter> <Enter>
autocmd CmdwinEnter * nnoremap <buffer> q :q<Enter>

" --- Backup ---
set nobackup                " No backup file (defaults to .filename~)
set directory=~/.vim/.swp// " Swap file directory

" --- View ---
set viewdir=~/.vim/.view//
augroup automatic_view
	autocmd!
	autocmd BufWinLeave * silent! mkview
	autocmd BufWinEnter * silent! loadview
augroup END

" --- Large File ---
augroup large_file
	au BufReadPre *
		\ if getfsize(expand("%")) > 10000000 |
			\ setlocal noswapfile eventignore+=FileType |
		\ endif
	" Always turn on syntax highlighting
	au BufReadPost * silent set syntax=on
augroup END

" --- Undo ---
"set undofile               " Enable undo file
"set undodir=~/.vim/.undo// " Undo file directory


" ====================
"    BEAUTIFICATION
" ====================
runtime ~/.vim                 " Pointer to .vim directory
syntax on                      " Enable syntax highlighting
set t_Co=256                   " Terminal supports 256 colors
set encoding=utf-8             " Set Vim character encoding to UTF-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8           " Specify script character encoding to UTF-8
set guifont=consolas           " Favorite font
set virtualedit=block


" --- Color Schemes - --
silent! colorscheme jellybeans " Favorite colorscheme
"silent! colorscheme codeschool
"silent! colorscheme molokai

" Cycle through color schemes
"nnoremap <F6> <Plug>ColorstepPrev
"nnoremap <F7> <Plug>ColorstepNext
"map <Leader>cp <Plug>ColorstepPrev
"map <Leader>cn <Plug>ColorstepNext
"map <Leader>cs <Plug>ColorstepReload

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"

" --- Display Settings ---
set number         " Show line number
set relativenumber " Show relative line number
set showmatch      " Show matching parantheses
set foldcolumn=3   " Show columns for folds


" Highlight current line
"TODO: Make CursorLine change color for insert mode
set cursorline
"autocmd InsertEnter * highlight CursorLine guifg=something
"autocmd InsertLeave * highlight CursorLine guifg=something

" Show tab characters and off-screen text indicator
"set list listchars=tab:▸\ ,eol:¬,trail:·,precedes:←,extends:→
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→


set nrformats-=octal

" Show spaces for indentation
let g:indentLine_char = '|'

" Change background color beyond column 80
let &colorcolumn=join(range(81,999),",")
highlight clear ColorColumn
au InsertEnter * highlight ColorColumn guibg=#000000 ctermbg=16
au InsertLeave * highlight clear ColorColumn


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
	autocmd BufWritePre * call StripTrailingWhitespace()

	" Automatically add +x permissions
	autocmd BufWritePre * if filereadable(expand("%")) &&  getline(1) =~ "^#!.*/bin/" | silent execute "!chmod +x %" | endif

augroup END


" Toggle list/number with <Leader>n
nnoremap <Leader>n :set number! relativenumber! list!<CR>
" Toggle expand tab
nnoremap <Leader><Tab> :set expandtab!<CR>
" Toggle wrap
nnoremap <Leader>sw :set wrap!<CR>

" --- Indentation Settings ---
set noexpandtab     " Use tabs instead of spaces
"set expandtab      " Use spaces instead of tabs
set tabstop=4       " Display tabs as 4 columns
set autoindent      " Use auto-indenting
set nocindent       " Don't use C style indenting

" --- Wrap Settings ---
set nowrap       " Disable wrap
set textwidth=0  " Disable maximum inserted text width
set wrapmargin=0 " Wrap margin

set scrolloff=4   " Lines above and below cursor
set sidescroll=1  " Horizontal number of columns to scroll

" --- Indentation Shortcuts ---
" Press <Tab> in visual mode to indent
vnoremap <Tab> >gv
" Press <Shift-Tab> in visual mode to unindent
vnoremap <S-Tab> <gv
" <Tab> in normal mode to indent
nnoremap <Tab> :call TabQuickFix('next')<Enter>
" <Shift-Tab> in normal mode to unindent
nnoremap <S-Tab> :call TabQuickFix('prev')<Enter>

" Replace indentation spaces with tabs
"nnoremap <Leader><Tab> :%s:^ \+:\=repeat("\t",strlen(submatch(0))/2):<Enter>

" =======================
"    GENERAL SHORTCUTS
" =======================

" Automatically reload file
"set autoread

" Backspace anything
set backspace=start,indent,eol

" TODO: Figure out how to unmap Shift-Backspace
"inoremap <S-BS> <nop>

" --- Save/Quit Shortcuts ---
nnoremap <F5> :edit<Enter>
nnoremap <S-F5> :edit!<Enter>
nnoremap <Leader>w :w!<Enter>
nnoremap <Leader>q :q!<Enter>
nnoremap <Leader>x :x!<Enter>
nnoremap <Leader>z :x!<Enter>

" Remap 'Undo' to 'U'
nnoremap U <C-r>

" Quickly replay a macro
nnoremap Q @q

set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50 lines of registers
set ruler            " show the cursor position all the time

" Automatically source .vimrc on save
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

" --- .vimrc ---
" Edit .vimrc
nnoremap <Leader>vi :e $MYVIMRC<Enter>
" Source .vimrc
nnoremap <Leader>vs :source $MYVIMRC<Enter>

"set visualbell
"set noerrorbells


" =================
"    VISUAL MODE
" =================

" Enter block visual mode with 'vv'
nnoremap vv <C-v>

" Exit visual mode with 'q'
vnoremap q <Esc>


" =============
"    VIMDIFF
" =============

" Update
nnoremap du :diffupdate<Enter>


" ===============
"    CLIPBOARD
" ===============

" --- Set Clipboard ---
"set clipboard=xterm_clipboard
set clipboard=unnamed

" Higlight last inserted text
nmap gV `[v`]


" ================
"    NAVIGATION
" ================

" --- Screen Shortcuts ---
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l

" --- Buffer Shortcuts ---
nnoremap > :bnext<Enter>
nnoremap < :bprev<Enter>
nnoremap <BS> <C-^>
nnoremap <Leader>bd :bd<Enter>

" --- QuickFix Shortcuts ---
function TabQuickFix(dir)
	if bufname("%") =~ '^fugitive://'
		if a:dir == 'next'
			cnext
		elseif a:dir == 'prev'
			cprev
		endif
	else
		if a:dir == 'next'
			normal! >>
		elseif a:dir == 'prev'
			normal! <<
		endif
	endif
endfunction

" Resize windows evenly
nnoremap <Leader>= <C-w>=

" Jump forward/backward
nnoremap <C-l> <C-i>
nnoremap <C-h> <C-o>

" Jump to definition
nnoremap <C-k> <C-]>


" ==============
"    MOVEMENT
" ==============

" Start of line
noremap H ^

" End of line
noremap L $

" Move one line for wrapped text
noremap j gj
noremap k gk

" Mark with M
noremap M m
" Jump to mark with m
noremap m '

" Repeat latest f, t, F or T in opposite direction
" Opposite direction of ;
noremap : ,

" Disable lookup
noremap K <nop>

" Stop using arrow keys
"map <Up> <nop>
"map <Down> <nop>
"map <Left> <nop>
"map <Right> <nop>
"imap <Up> <nop>
"imap <Down> <nop>
"imap <Left> <nop>
"imap <Right> <nop>

" Completion with C-j and C-k
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>


" --- Exit Insert Mode ---
inoremap jj <Esc>
inoremap kk <Esc>

" --- Search/Replace/Delete ---

let g:indexed_search_mappings = 0
" Default case-insensitive search
"nnoremap / :set ignorecase<Enter>/
"vnoremap / :set ignorecase<Enter>/

" Case-sensitive search
"nnoremap // :set noignorecase<Enter>/
"vnoremap // :set noignorecase<Enter>/
set ignorecase " Ignore case for searching
"set smartcase  " Ignore case if all lowercase, case-sensitive otherwise
"set hlsearch   " Highlight search matches (handled by vim-slash plugin)
set incsearch   " Show matches while typing

" TODO: Delete this
" Turn off search highlighting
"nnoremap <Leader>/ :nohlsearch<CR>

" Search for higlighted text
vnoremap * y/<C-R>"<CR>

" Delete matching rows
nnoremap d/ :g//d<Enter>

" Replace matching words
nnoremap c/ :%s///g<Left><Left>

" Split up shell command into multiple lines
nnoremap <Leader>\ :s/\v\s+-/ \\\r\t-/g<Enter>

" --- Delete Patterns ---
" Delete trailing whitespace
nnoremap <Leader>d$ :%s/\s\+$//g<Enter>
" Delete non-ASCII characters
nnoremap <Leader>dx :%s/[^\x00-\x7F]//g<Enter>
" Delete carriage returns
nnoremap <Leader>d<Enter> :%s/\r//g<Enter>

" --- Abbreviations ---
" Help
cabbrev help vert help

" Set filetypes
cabbrev sfl setfiletype log
cabbrev sfv setfiletype verilog_systemverilog

