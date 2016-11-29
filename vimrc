
" ============
"    VUNDLE
" ============
runtime vundle.vim

" ======================
"    GENERAL SETTINGS
" ======================
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
set encoding=utf-8             " Set Vim character encoding to UTF-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8           " Specify script character encoding to UTF-8
set guifont=consolas           " Favorite font


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

" --- Display Settings ---
set list           " Enable list mode
set number         " Show line number
set relativenumber " Show relative line number
set showmatch      " Show matching parantheses
set cursorline     " Highlight current line

" Show tab characters
" Show last column
set listchars=tab:\|-,extends:\|

" Show spaces for indentation
let g:indentLine_char = '|'

" Highlight column 81 and trailing whitespace
autocmd BufRead * match SpellBad /\%81v.\|\s\+$/

" Highlight every 3rd digit of numbers
autocmd BufRead * 2match Delimiter /\d\ze\%(\d\d\%(\d\{3}\)*\)\>/

" Disable comment formatting
autocmd BufNewFile,BufRead * set formatoptions-=cro

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

" --- Indentation Shortcuts ---
" Format file with indentation
nnoremap == gg=G
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


" =============
"    VIMDIFF
" =============

" Update
nnoremap du :diffupdate<Enter>

" =============
"    PLUGINS
" =============

" --- NERDTree ---
let g:NERDTreeDirArrows=0
nnoremap <Leader>f :NERDTreeToggle<CR>

" --- TagBar ---
nnoremap <Leader>t :TagbarToggle<CR>

" --- Fugitive ---
nnoremap <Leader>gb :Gblame<Enter>
nnoremap <Leader>gd :Gvdiff<Enter>
nnoremap <Leader>gh :help fugitive<Enter>
nnoremap <Leader>gl :Glog
nnoremap <Leader>gp :Gpull
nnoremap <Leader>gs :Gstatus<Enter>

" --- GitGutter ---
nnoremap <Leader>gg :GitGutterToggle<Enter>

" --- NERDCommenter ---
nmap # <Plug>NERDCommenterToggle
xmap # <Plug>NERDCommenterToggle


" ===============
"    CLIPBOARD
" ===============

" --- Set Clipboard ---
"set clipboard=xterm_clipboard
set clipboard=unnamed

" --- System Clipboard ---
" <Space>p to paste system clipboard
"nnoremap <Leader>p "*p
" <Space>y to copy to system clipboard
"vnoremap <Leader>y "+y


"nnoremap <silent> p p`]
"vnoremap <silent> p p`]
"vnoremap <silent> y y`]

" Higlight last inserted text
nmap gV `[v`]


" ================
"    NAVIGATION
" ================

" --- Buffer Shortcuts ---
nnoremap > :bnext<Enter>
nnoremap < :bprev<Enter>
nnoremap <Leader>bn :bnext<Enter>
nnoremap <Leader>bp :bprev<Enter>
nnoremap <Leader>bd :bdelete<Enter>

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

" --- Screen Shortcuts ---
" vim-tmux-navigator shortcuts
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <Leader>h :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader>j :TmuxNavigateDown<cr>
nnoremap <silent> <Leader>k :TmuxNavigateUp<cr>
nnoremap <silent> <Leader>l :TmuxNavigateRight<cr>
nnoremap <silent> <Leader>- :TmuxNavigatePrevious<cr>

execute "set <M-h>=\<Esc>h"
execute "set <M-j>=\<Esc>j"
execute "set <M-k>=\<Esc>k"
execute "set <M-l>=\<Esc>l"
nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>

" Resize windows evenly
nnoremap <Leader>= <C-w>=


" ==============
"    MOVEMENT
" ==============

" --- CamelCaseMotion Plugin ---
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
"map <silent> ge <Plug>CamelCaseMotion_ge
"sunmap w
"sunmap b
"sunmap e
"sunmap ge
"omap <silent> iw <Plug>CamelCaseMotion_iw
"xmap <silent> iw <Plug>CamelCaseMotion_iw
"omap <silent> ib <Plug>CamelCaseMotion_ib
"xmap <silent> ib <Plug>CamelCaseMotion_ib
"omap <silent> ie <Plug>CamelCaseMotion_ie
"xmap <silent> ie <Plug>CamelCaseMotion_ie

" Start of line
nnoremap H ^
vnoremap H ^

" End of line
nnoremap L $
vnoremap L $

" Move one line for wrapped text
nnoremap j gj
nnoremap k gk

" Mark with M
nnoremap M m
" Jump to mark with m
nnoremap m '

" Repeat latest f, t, F or T in opposite direction
" Opposite direction of ;
nnoremap : ,
vnoremap : ,

" Disable lookup
map K <nop>

" Stop using arrow keys
"map <Up> <nop>
"map <Down> <nop>
"map <Left> <nop>
"map <Right> <nop>
"imap <Up> <nop>
"imap <Down> <nop>
"imap <Left> <nop>
"imap <Right> <nop>


" --- Exit Insert Mode ---
inoremap jj <Esc>
inoremap kk <Esc>

" --- Search/Replace/Delete ---

" Default case-insensitive search
nnoremap / :set ignorecase<Enter>/
vnoremap / :set ignorecase<Enter>/

" Case-sensitive search
nnoremap // :set noignorecase<Enter>/
vnoremap // :set noignorecase<Enter>/

set ignorecase   " Ignore case for searching
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

" Search for errors
nnoremap ge /\<error\>\\|\<fatal\><Enter>

" --- Delete Patterns ---
" Delete trailing whitespace
nnoremap <Leader>d$ :%s/\s\+$//g<Enter>
" Delete non-ASCII characters
nnoremap <Leader>dx :%s/[^\x00-\x7F]//g<Enter>
" Delete carriage returns
nnoremap <Leader>d<Enter> :%s/\r//g<Enter>

" --- Help ---
cabbrev help vert help

