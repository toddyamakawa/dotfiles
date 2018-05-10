
local here=${0:h}

# --- Path ---
function addpath() { export PATH=$PATH:$1; }

function echo_eval() {
	echo "$@"
	eval "$@"
}


# --- zsh ---
function zsh-theme() {
	if [[ -f $ZSH/themes/$1.zsh-theme ]]; then
		ZSH_THEME=$1
		zshrc
	else
		if [[ -z $1 ]]; then
			unset ZSH_THEME
			zshrc
		else
			echo "Unable to find theme: $1"
		fi
	fi
}

# --- stderr ---
alias -g 2null='2>/dev/null'
alias -g 2out='2>&1'
alias -g P='|&'

# --- Time ---
alias now='date +%y%m%d-%H%M%S'
alias week="date +%U"

# --- General ---
alias which='whence -c'
alias func='print -l ${(ok)functions}'
alias funcg='print -l ${(ok)functions} | grep'

alias pwd='pwd -P'
alias mkdir='mkdir -pv'

alias find='find -O3'
alias findn='find . -name'

alias sortn='sort -n'
alias usort='sort | uniq -c | sort -n'

alias hostname='hostname --long'

# --- General ---
alias wrap="printf '\033[?7h'"
alias nowrap="printf '\033[?7l'"
alias tab2="expand -t2"
alias tab4="expand -t4"
alias tab8="expand -t8"
alias cutw='cut -c 1-$COLUMNS'
alias xterm='xterm -fg white -bg black -fa consolas -fs 10'

alias lns='ln -s'
alias lnsf='ln -sf'

alias catn='cat -n'
alias tailf='tail -n 100 -F'

# --- echo ---
alias echo='echo -e'

function powerline_check() {
	echo "Symbols: \ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"
	echo "fc-list: $(fc-list | grep -i powerline)"
	echo "xlsfonts: $(xlsfonts | grep -i powerline)"
}

alias .tar='tar xf'
alias .tar.bz2='tar xjf'
alias .tar.gz='tar xzf'


alias ls='ls -h --color'
alias ll='ls -lrth'
alias lll='ll | grep "\->"'
alias lsd='ll -d */'
alias lla='ll -a'
alias ls1='find . -maxdepth 1'
alias ls2='find . -maxdepth 2'
alias ls3='find . -maxdepth 3'
alias ls4='find . -maxdepth 4'
alias ls5='find . -maxdepth 5'
alias ls6='find . -maxdepth 6'

alias find1='ls1 | grep -i'
alias find2='ls2 | grep -i'
alias find3='ls3 | grep -i'
alias find4='ls4 | grep -i'
alias find5='ls5 | grep -i'
alias find6='ls6 | grep -i'

alias df='df -h'
alias du='du -ch'
alias du1='du --max-depth=1'
alias du2='du --max-depth=2'
alias du3='du --max-depth=3'

alias suu='su $(whoami)'

alias less='less -r'

alias weather='curl "wttr.in/austin?u"'

function calc() { bc -l <<< "$@"; }

function blank() { dd if=/dev/zero of=blank"$1"M.bin bs=1M count=$1; }

function setdisp() {
	[[ -n $LSB_BATCH_JID ]] && return
	[[ -z $VNCDESKTOP ]] && return
	port=$(echo $VNCDESKTOP | awk 'match($1, /.*(:[0-9]+)/, groups) {print groups[1]}')
	export DISPLAY=$port.0
}

function rmrf() {
	local src dest
	for src in $@; do
		src=${src%/}
		dest=$(dirname $src)/deleting.$(basename $src).$$
		mv $src $dest
		rm -rf $dest &
	done
}

function cp1() {
	local dir=$1
	mkdir $(basename $dir)
	cp $dir/* $(basename $dir)
}

# --- Colors ---
function zsh_colors() {
	for color in RED YELLOW GREEN BLUE CYAN MAGENTA BLACK WHITE; do
		echo "$fg_bold[${(L)color}]BOLD $fg_no_bold[${(L)color}]$color"
	done
}

# --- Source Files ---
source $here/my-options.zsh
source_files $here/alias/*.zsh
