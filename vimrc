
" ==============================================================================
" VIM-PLUG
" ==============================================================================

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


" --- .vim Directory ---
runtime ~/.vim


" ==============================================================================
" GENERAL SETTINGS
" ==============================================================================
set history=50     " Save 50 command lines of history

" --- Command Line ---
nnoremap <Enter> :
vnoremap <Enter> :
nnoremap <Leader><Enter> <Enter>
vnoremap <Leader><Enter> <Enter>

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

" --- Undo ---
"set undofile               " Enable undo file
"set undodir=~/.vim/.undo// " Undo file directory


" ==============================================================================
" BEAUTIFICATION
" ==============================================================================

" --- Color Schemes - --
silent! colorscheme jellybeans " Favorite colorscheme
"silent! colorscheme codeschool
"silent! colorscheme molokai
"silent colorscheme vim-monokai-tasty

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

set nrformats-=octal " Numbers starting in 0 will not be treated as octal

" Show spaces for indentation
let g:indentLine_char = '|'

" Change background color beyond column 80
let &colorcolumn=join(range(81,999),",")
highlight clear ColorColumn
au InsertEnter * highlight ColorColumn guibg=#000000 ctermbg=16
au InsertLeave * highlight clear ColorColumn

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

" ==============================================================================
" GENERAL SHORTCUTS
" ==============================================================================

" Automatically reload file
"set autoread

" Backspace anything
set backspace=start,indent,eol

" TODO: Figure out how to unmap Shift-Backspace
"inoremap <S-BS> <nop>

nnoremap <F5> :edit<Enter>
nnoremap <S-F5> :edit!<Enter>

" Remap 'Undo' to 'U'
nnoremap U <C-r>

" Quickly replay a macro
nnoremap Q @q

set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50 lines of registers
set ruler            " show the cursor position all the time

" Automatically source .vimrc on save
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"set novisualbell
"set noerrorbells
set belloff=all


" ==============================================================================
" VISUAL MODE
" ==============================================================================

" Enter block visual mode with 'vv'
nnoremap vv <C-v>

" Exit visual mode with 'q'
vnoremap q <Esc>


" ==============================================================================
" VIMDIFF
" ==============================================================================

" Update
nnoremap du :diffupdate<Enter>


" ==============================================================================
" CLIPBOARD
" ==============================================================================


" --- Set Clipboard ---
"set clipboard=xterm_clipboard
set clipboard=unnamed

" Higlight last inserted text
nmap gV `[v`]


" ==============================================================================
" NAVIGATION
" ==============================================================================

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

" Jump forward/backward
nnoremap <C-l> <C-i>
nnoremap <C-h> <C-o>

" Jump to definition
nnoremap <C-k> <C-]>


" ==============================================================================
" MOVEMENT
" ==============================================================================

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
cnoreabbrev help vert help

" Set filetypes
cabbrev sfl setfiletype log
cabbrev sfv setfiletype verilog_systemverilog

