
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

	" =================
	"    INTEGRATION
	" =================

	" --- vim-tmux-navigator ---
	Plugin 'christoomey/vim-tmux-navigator'

	" --- File Explorer ---
	" help :NERDTree
	Plugin 'scrooloose/nerdtree'

	" --- Buffer List ---
	Plugin 'ap/vim-buftabline'

	" --- Ctag Browser ---
	" :help tagbar
	Plugin 'majutsushi/tagbar'

	" --- Git ---
	" :help fugitive
	Plugin 'tpope/vim-fugitive'

	" :help gitgutter
	Plugin 'airblade/vim-gitgutter'

	" --- vim-manpager ---
	" export MANPAGER="vim -c MANPAGER -"
	Plugin 'lambdalisue/vim-manpager'

	" --- matchit ---
	" :help matchit
	Plugin 'tmhedberg/matchit'

	" --- Comments ---
	Plugin 'scrooloose/nerdcommenter'

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

	"Plugin 'nachumk/systemverilog.vim'

" --- Vundle End ---
call vundle#end()
filetype plugin indent on

