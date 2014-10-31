
" ====================
"    BEAUTIFICATION
" ====================
syntax on                      " Enable syntax highlighting
set t_Co=256                   " Terminal supports 256 colors
runtime /home/tyamakaw/.vim    " Pointer to .vim directory
set guifont=consolas           " Favorite Font
colorscheme jellybeans         " Favorite colorscheme

" --- Syntax Highlighting for Other File Types ---
autocmd BufNewFile,BufRead *.qel set syntax=tcl
autocmd BufNewFile,BufRead *.tdf set syntax=verilog

set nocompatible   " Enable user .vimrc file
set nowrap            " Don't wrap long lines
set bs=2              " allow backspacing over everything in insert mode
set nobackup          " keep a backup file (defaults to .filename~)
set viminfo='20,\"50  " read/write a .viminfo file, don't store more than 50 lines of registers
set history=50        " keep 50 lines of command line history
set ruler             " show the cursor position all the time
set scrolloff=4
set showmatch         " Show matching parantheses

set list
set listchars=tab:+-,trail:_

set laststatus=2 "Always display status line


"set visualbell
"set noerrorbells



map <Leader>f :NERDTree<CR>



if has("autocmd")
    autocmd BufNewFile,BufRead Makefile set noexpandtab " Makefiles ensure that we don't expand tabs since tabs are special
endif



" lhs comments -- select a range then hit ,# to insert hash comments
" or ,/ for // comments, or ,c to clear comments.
map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch<CR>

" wrapping comments -- select a range then hit ,* to put  /* */ around
" selection, or ,d to clear them
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> <Esc>:nohlsearch<CR>




" =================
"    INDENTATION
" =================

" --- Indentation Settings ---
set noexpandtab     " Use tabs instead of spaces
set tabstop=4       " Display tabs as 4 columns
set softtabstop=4   " Set tab to 4 columns
set shiftwidth=4    " Set tab to 4 columns
set autoindent      " Use auto-indenting
set nocindent       " Don't use C style indenting

" --- Indentation Shortcuts ---
nnoremap == gg=G
vnoremap <Tab> >
vnoremap <S-Tab> <


" --- Set <Leader> to Space ---
let mapleader=" "

" --- Save/Quit Shortcuts ---
nnoremap <Leader>w :w!<Enter>
nnoremap <Leader>q :q!<Enter>
nnoremap <Leader>z :w!<Enter>:q!<Enter>

" --- Screen Shortcuts ---
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" --- Navigation ---
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
nnoremap H 0
nnoremap L $

" --- Exit Insert Mode ---
inoremap jj <Esc>
inoremap kk <Esc>

" --- Search/Replace/Delete ---
set smartcase   " Ignore case if all lowercase, case-sensitive otherwise
set hlsearch    " Highlight search matches
set incsearch   " Show matches while typing

" Turn off search highlighting
map <Leader>/ :nohlsearch<CR>

" Delete matching rows
nnoremap d/ :g//d<Enter>

" Replace matching words
nnoremap c/ :%s///<Left>



