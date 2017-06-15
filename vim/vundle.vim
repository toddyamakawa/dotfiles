
" ============
"    VUNDLE
" ============

" --- Install ---
" :source %
" :PluginInstall

" --- List ---
" :PluginList

" --- Setup ---
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" --- Vundle Begin ---
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'

	" ===============
	"    INTERFACE
	" ===============

	" --- Color Schemes ---
	"Plugin 'qualiabyte/vim-colorstepper'
	Plugin 'nanotech/jellybeans.vim'
	Plugin 'tomasr/molokai'
	Plugin 'antlypls/vim-colors-codeschool'

	" --- Indentation ---
	Plugin 'yggdroot/indentline'
	"Plugin 'nathanaelkane/vim-indent-guides.git'

	" --- .tmux.conf Syntax ---
	Plugin 'keith/tmux.vim'

	" --- ANSI Escape Syntax ---
	"Plugin 'powerman/vim-plugin-AnsiEsc'
	"Plugin 'chase/vim-ansible-yaml'

	" =================
	"    INTEGRATION
	" =================

	" --- vim-tmux-navigator ---
	Plugin 'christoomey/vim-tmux-navigator'

	" --- NERDTree ---
	" Filesystem explorer
	" :help NERDTree
	Plugin 'scrooloose/nerdtree'

	" --- vim-buftabline ---
	" Replaces tabs with buffers
	Plugin 'ap/vim-buftabline'

	" --- Ctag Browser ---
	" :help tagbar
	Plugin 'majutsushi/tagbar'

	" --- Git ---
	" :help fugitive
	Plugin 'tpope/vim-fugitive'

	" :help gitgutter
	Plugin 'airblade/vim-gitgutter'

	" --- Linter ---
	" Asynchronous Linting Engine (ALE)
	" :help ale
	Plugin 'w0rp/ale'

	" Ruby linter
	Plugin 'bbatsov/rubocop'

	" --- vim-manpager ---
	" export MANPAGER="vim -c MANPAGER -"
	Plugin 'lambdalisue/vim-manpager'

	" --- matchit ---
	" :help matchit
	Plugin 'tmhedberg/matchit'

	" --- Comments ---
	Plugin 'scrooloose/nerdcommenter'

	" --- Search ---
	" Displays number of times pattern occurs
	"Plugin 'google/vim-searchindex'
	" Automatically clears search highlight
	Plugin 'junegunn/vim-slash'

	" ==============
	"    COMMANDS
	" ==============

	" --- vim-surround ---
	" :help surround
	Plugin 'tpope/vim-surround'

	" --- vim-speeddating ---
	" :help speeddating
	Plugin 'tpope/vim-speeddating'

	" --- vim-repeat ---
	" Support repeat for plugin commands
	Plugin 'tpope/vim-repeat'

	" --- CamelCaseMotion ---
	" Support CamelCase motions
	Plugin 'bkad/CamelCaseMotion'

	" --- Experimental Plugins ---
	" Plugins to experiment with
	" :help airline
	"Plugin 'vim-airline/vim-airline'
	" :help ctrlspace
	"Plugin 'vim-ctrlspace/vim-ctrlspace'

	"Plugin 'Lokaltog/vim-powerline'

" --- Vundle End ---
call vundle#end()
filetype plugin indent on

