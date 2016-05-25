
" ==============
"    VIM-PLUG
" ==============
" :PlugInstall
call plug#begin('~/.vim/plugged')

	" --- Color Schemes ---
	Plug 'nanotech/jellybeans.vim'
	Plug 'tomasr/molokai'

	" --- vim-surround ---
	" :help surround
	Plug 'tpope/vim-surround'

	" --- File Explorer ---
	" help :NERDTree
	Plug 'scrooloose/nerdtree'

	" --- Ctag Browser ---
	" :help tagbar
	Plug 'majutsushi/tagbar'

	" --- vim-repeat ---
	" Support repeat for plugin commands
	Plug 'tpope/vim-repeat'

	" --- Git ---
	" :help fugitive
	Plug 'tpope/vim-fugitive'

	" --- Buffer List ---
	Plug 'ap/vim-buftabline'

	" --- Experimental Plugins ---
	" Plugins to experiment with
	" :help airline
	"Plug 'vim-airline/vim-airline'
	" :help ctrlspace
	"Plug 'vim-ctrlspace/vim-ctrlspace'

call plug#end()

" ======================
"    GENERAL SETTINGS
" ======================
set nocompatible   " Enable user .vimrc file
set history=50     " Save 50 command lines of history
set laststatus=2   " Always display status line

" --- Set <Leader> to Space ---
let mapleader="\<space>"
let g:mapleader="\<space>"

" --- Quick Command Line Mode ---
nnoremap <Enter> :

" --- Backups ---
set nobackup                " No backup file (defaults to .filename~)
set directory=~/.vim/.swp// " Swap file directory


" ====================
"    BEAUTIFICATION
" ====================
runtime ~/.vim                 " Pointer to .vim directory
syntax on                      " Enable syntax highlighting
set t_Co=256                   " Terminal supports 256 colors
set encoding=utf-8             " Set character encoding to UTF-8
set guifont=consolas           " Favorite font
colorscheme jellybeans         " Favorite colorscheme
"colorscheme molokai

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" --- Display Settings ---
set list           " Enable list mode
set number         " Show line number
set relativenumber " Show relative line number
set showmatch      " Show matching parantheses

" Show tab characters
" Show last column
set listchars=tab:+-,extends:\|

" Highlight column 81 and trailing whitespace
autocmd BufRead * match SpellBad /\%81v.\|\s\+$/


" Toggle with <Leader>n
nnoremap <Leader>n :set number! relativenumber! list!<CR>
" Toggle expand tab
nnoremap <Leader><Tab> :set expandtab!<CR>

" --- Indentation Settings ---
set noexpandtab     " Use tabs instead of spaces
"set expandtab      " Use spaces instead of tabs
set tabstop=4       " Display tabs as 4 columns
set softtabstop=4   " Set tab to 4 columns
set shiftwidth=4    " Set tab to 4 columns
set autoindent      " Use auto-indenting
set nocindent       " Don't use C style indenting

" --- Wrap Settings ---
set nowrap       " Disable wrap
set textwidth=0  " Disable maximum inserted text width
set wrapmargin=0 " Wrap margin

set scrolloff=4   " Lines above and below cursor
set sidescroll=1  " Horizontal number of columns to scroll

" --- Syntax Highlighting for Other File Types ---
autocmd BufNewFile,BufRead *.pl set expandtab
autocmd BufNewFile,BufRead *.qel,*.veloce,*.do set syntax=tcl
autocmd BufNewFile,BufRead *.v,*.sv,*.svh,*.svrb,*.tdf set syntax=verilog tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead Makefile set noexpandtab

" --- Indentation Shortcuts ---
" Format file with indentation
nnoremap == gg=G
" Press <Tab> in visual mode to indent
vnoremap <Tab> >gv
" Press <Shift-Tab> in visual mode to unindent
vnoremap <S-Tab> <gv
" <Tab> in normal mode to indent
nnoremap <Tab> >>
" <Shift-Tab> in normal mode to unindent
nnoremap <S-Tab> <<

" Replace indentation spaces with tabs
"nnoremap <Leader><Tab> :%s:^ \+:\=repeat("\t",strlen(submatch(0))/2):<Enter>



" =======================
"    GENERAL SHORTCUTS
" =======================

" Automatically reload file
set autoread

" --- Save/Quit Shortcuts ---
nnoremap <F5> :edit<Enter>
nnoremap <S-F5> :edit!<Enter>
nnoremap <Leader>w :w!<Enter>
nnoremap <Leader>q :q!<Enter>
nnoremap <Leader>x :x!<Enter>
nnoremap <Leader>z :x!<Enter>

set bs=2              " allow backspacing over everything in insert mode
set viminfo='20,\"50  " read/write a .viminfo file, don't store more than 50 lines of registers
set ruler             " show the cursor position all the time

" Automatically source .vimrc on save
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"set visualbell
"set noerrorbells

" =================
"    VISUAL MODE
" =================
" Enter block visual mode with 'vv'
nnoremap vv <C-v>


" =============
"    PLUGINS
" =============

" --- NERDTree ---
let g:NERDTreeDirArrows=0
map <Leader>f :NERDTreeToggle<CR>

" --- TagBar ---
map <Leader>t :TagbarToggle<CR>

" --- Fugitive ---
map <Leader>gh :help fugitive<Enter>
map <Leader>gs :Gstatus<Enter>
map <Leader>gp :Gpull
map <Leader>gl :Glog




" Remap 'Undo' to 'U'
nnoremap U <C-r>




" ===============
"    CLIPBOARD
" ===============

"set clipboard=xterm_clipboard

" --- System Clipboard ---
" <Space>p to paste system clipboard
nnoremap <Leader>p "*p
" <Space>y to copy to system clipboard
vnoremap <Leader>y "+y


nnoremap <silent> p p`]
vnoremap <silent> p p`]
"vnoremap <silent> y y`]

" Higlight last inserted text
nmap gV `[v`]

" Quickly replay a macro
nnoremap Q @q



" --- Screen Shortcuts ---
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" --- Navigation ---
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <up> <nop>
"imap <down> <nop>
"imap <left> <nop>
"imap <right> <nop>

" Move one line for wrapped text
nnoremap j gj
nnoremap k gk

nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap H ^
nnoremap L $

" --- Exit Insert Mode ---
inoremap jj <Esc>
inoremap kk <Esc>

" --- Search/Replace/Delete ---

" Default case-insensitive search
nnoremap / /\c

"set ignorecase   " Ignore case for searching
"set smartcase    " Ignore case if all lowercase, case-sensitive otherwise
set hlsearch     " Highlight search matches
set incsearch    " Show matches while typing

" Turn off search highlighting
nnoremap <Leader>/ :nohlsearch<CR>

" Search for higlighted text
vnoremap * y/<C-R>"<CR>

" Delete matching rows
nnoremap d/ :g//d<Enter>

" Replace matching words
nnoremap c/ :%s///g<Left><Left>

" Delete trailing whitespace
nnoremap <Leader>$ :%s/\s\+$//

" Search for errors
nnoremap ge /\<error\>\\|\<fatal\><Enter>

" --- Help ---
cabbrev help vert help


