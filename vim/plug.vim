
" ==============================================================================
" INTERFACE
" ==============================================================================

" --- Color Schemes ---
"Plug 'qualiabyte/vim-colorstepper'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'antlypls/vim-colors-codeschool'
Plug 'patstockwell/vim-monokai-tasty'

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
cnoreabbrev rain RainbowLevelsToggle

"Plug 'nathanaelkane/vim-indent-guides.git'
"Plug 'tpope/vim-sleuth'

" --- .tmux.conf Syntax ---
Plug 'keith/tmux.vim'

" --- fzf ---
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" --- Fish Syntax ---
Plug 'dag/vim-fish'

" --- ANSI Escape Syntax ---
Plug 'vim-scripts/AnsiEsc.vim', { 'on': 'AnsiEsc' }
cnoreabbrev ansi AnsiEsc


" ==============================================================================
" INTEGRATION
" ==============================================================================

" --- UltiSnips ---
Plug 'SirVer/ultisnips'
cnoreabbrev ultie UltiSnipsEdit
cnoreabbrev ultif UltiSnipsAddFiletypes

" Trigger configuration
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Directory configuration
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


" --- Quick-Scope ---
" Highlights characters that are good targets for F/f/T/t
Plug 'unblevable/quick-scope'

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

" --- tmux support ---
Plug 'tpope/vim-tbone'

" --- Text Objects ---
" Text object based on indentation level
Plug 'michaeljsmith/vim-indent-object'

" --- Search ---
" Displays number of times pattern occurs
"Plug 'google/vim-searchindex'

" Displays number of times pattern occurs
Plug 'henrik/vim-indexed-search'

" Automatically clears search highlight
Plug 'junegunn/vim-slash'
noremap <silent> <Plug>(slash-after) :<C-u>ShowSearchIndex<CR>
xunmap <Plug>(slash-after)

" Search for two characters
"Plug 'justinmk/vim-sneak'
"map s <Plug>sneak_s


" ==============================================================================
" COMMANDS
" ==============================================================================

" --- vim-easy-align ---
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" --- vim-JumpToVerticalOccurrence ---
Plug 'inkarkat/vim-JumpToVerticalOccurrence'

" --- vim-surround ---
" :help surround
Plug 'tpope/vim-surround'

" --- vim-speeddating ---
" :help speeddating
Plug 'tpope/vim-speeddating'

" --- vim-repeat ---
" Support repeat for Plug commands
Plug 'tpope/vim-repeat'


" ==============================================================================
" SYNTAX
" ==============================================================================

" --- Verilog/SystemVerilog ---
Plug 'vhda/verilog_systemverilog.vim'
"Plug 'verilog_systemverilog.vim'

" --- vim-scripts ---
Plug 'vim-scripts/CountJump'
Plug 'vim-scripts/ingo-library'

" --- Miscenllaneous ---
Plug 'guns/xterm-color-table.vim',  { 'on': 'XtermColorTable' }


" ==============================================================================
" EXPERIMENTAL PLUGINS
" ==============================================================================

" Plugins to experiment with
" :help airline
"Plug 'vim-airline/vim-airline'
" :help ctrlspace
"Plug 'vim-ctrlspace/vim-ctrlspace'

"Plug 'Lokaltog/vim-powerline'

"Plug 'tpope/vim-dispatch'


" ==============================================================================
" TODD-ONLY STUFF
" ==============================================================================
Plug '~/.vim/my-plugins'

