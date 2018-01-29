
" ===============
"    INTERFACE
" ===============

" --- Color Schemes ---
"Plug 'qualiabyte/vim-colorstepper'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'antlypls/vim-colors-codeschool'

" --- Indentation ---
Plug 'yggdroot/indentline'
"Plug 'nathanaelkane/vim-indent-guides.git'
"Plug 'tpope/vim-sleuth'

" --- .tmux.conf Syntax ---
Plug 'keith/tmux.vim'

" --- ANSI Escape Syntax ---
"Plug 'powerman/vim-Plug-AnsiEsc'
"Plug 'chase/vim-ansible-yaml'

" =================
"    INTEGRATION
" =================

" --- NERDTree ---
" Filesystem explorer
" :help NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" --- vim-buftabline ---
" Replaces tabs with buffers
Plug 'ap/vim-buftabline'

" --- Ctag Browser ---
" :help tagbar
Plug 'majutsushi/tagbar'

" --- Git ---
" :help fugitive
Plug 'tpope/vim-fugitive'

" :help gitgutter
Plug 'airblade/vim-gitgutter'

" --- Linter ---
" Asynchronous Linting Engine (ALE)
" :help ale
Plug 'w0rp/ale'

" Ruby linter
Plug 'bbatsov/rubocop'

" --- vim-manpager ---
" export MANPAGER="vim -c MANPAGER -"
Plug 'lambdalisue/vim-manpager'

" --- matchit ---
" :help matchit
Plug 'tmhedberg/matchit'

" --- Comments ---
Plug 'scrooloose/nerdcommenter'

" --- Search ---
" Displays number of times pattern occurs
"Plug 'google/vim-searchindex'

" Displays number of times pattern occurs
Plug 'henrik/vim-indexed-search'
" Automatically clears search highlight
Plug 'junegunn/vim-slash'

Plug 'vim-scripts/AnsiEsc.vim', { 'on': 'AnsiEsc' }
cabbrev ansi AnsiEsc

" ==============
"    COMMANDS
" ==============

" --- vim-surround ---
" :help surround
Plug 'tpope/vim-surround'

" --- vim-speeddating ---
" :help speeddating
Plug 'tpope/vim-speeddating'

" --- vim-repeat ---
" Support repeat for Plug commands
Plug 'tpope/vim-repeat'

" --- Experimental Plugins ---
" Plugins to experiment with
" :help airline
"Plug 'vim-airline/vim-airline'
" :help ctrlspace
"Plug 'vim-ctrlspace/vim-ctrlspace'

"Plug 'Lokaltog/vim-powerline'
"Plug 'verilog_systemverilog.vim'

