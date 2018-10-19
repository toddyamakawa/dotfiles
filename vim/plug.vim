
" ===============
"    INTERFACE
" ===============

" --- Color Schemes ---
"Plug 'qualiabyte/vim-colorstepper'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'antlypls/vim-colors-codeschool'

" --- Clipboard ---
" TODO: Figure out this plugin
" https://github.com/kana/vim-fakeclip
" Plug 'kana/vim-fakeclip'

" --- Indentation ---
Plug 'yggdroot/indentline'

" Reset IndentLines when tabstop changes
autocmd OptionSet tabstop IndentLinesReset

" --- Rainbow Indentation ---
"Plug 'thiagoalessio/rainbow_levels.vim', { 'on': 'RainbowLevelsToggle' }
Plug 'thiagoalessio/rainbow_levels.vim'
cabbrev rain RainbowLevelsToggle

"Plug 'nathanaelkane/vim-indent-guides.git'
"Plug 'tpope/vim-sleuth'

" --- .tmux.conf Syntax ---
Plug 'keith/tmux.vim'

" --- fzf ---
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" --- ANSI Escape Syntax ---
Plug 'vim-scripts/AnsiEsc.vim', { 'on': 'AnsiEsc' }
cabbrev ansi AnsiEsc


" =================
"    INTEGRATION
" =================

" TODO: QuickScope

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
noremap <silent> <Plug>(slash-after) :<C-u>ShowSearchIndex<CR>
xunmap <Plug>(slash-after)


" ==============
"    COMMANDS
" ==============

" --- vim-easy-align ---
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" --- vim-surround ---
" :help surround
Plug 'tpope/vim-surround'

" --- vim-speeddating ---
" :help speeddating
Plug 'tpope/vim-speeddating'

" --- vim-repeat ---
" Support repeat for Plug commands
Plug 'tpope/vim-repeat'


" ============
"    SYNTAX
" ============

" --- Verilog/SystemVerilog ---
Plug 'vhda/verilog_systemverilog.vim'
"Plug 'verilog_systemverilog.vim'



" ==========================
"    EXPERIMENTAL PLUGINS
" ==========================

" Plugins to experiment with
" :help airline
"Plug 'vim-airline/vim-airline'
" :help ctrlspace
"Plug 'vim-ctrlspace/vim-ctrlspace'

"Plug 'Lokaltog/vim-powerline'

"Plug 'tpope/vim-dispatch'


" =====================
"    TODD-ONLY STUFF
" =====================
Plug '~/.vim/my-plugins'

