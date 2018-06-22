
local here=${0:h}

# --- Source ---
source ~/.fzf.zsh
local fzfpath=$(git -C $(dirname $(which fzf)) rev-parse --show-toplevel)
source $fzfpath/shell/key-bindings.zsh


# --- Key Bindings ---

#bindkey -M vicmd '^[c' fzf-cd-widget

bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

bindkey -M viins '^[[Z' fzf-magic-complete
bindkey -M viins '^[[Z' fzf-magic-complete


# --- Functions ---

# List Git files
function fzf-gitfiles() {
	if [[ -d $GIT_TOP ]]; then
		git -C $GIT_TOP ls-files | sed -e 's/^/$GIT_TOP\//'
	fi
}

# Recrusively list files, shallow first
function fzf-files() {
	local dir file here=${1-.}
	local -U dirs
	dirs=($here)

	# For each directory
	while (( ${#dirs} != 0 )); do
		dir=$dirs[1]
		dirs[1]=()

		# For each file
		for file in $(\ls $dir); do
			entry=$dir/$file
			[[ -f $entry ]] && echo ${entry#./}
			[[ -d $entry ]] && dirs+=($entry)
		done
	done
}

# Recrusively list directories, shallow first
function fzf-dirs() {
	local dir file here=${1-.}
	local -U dirs
	dirs=($here)

	# For each directory
	while (( ${#dirs} != 0 )); do
		dir=$dirs[1]
		dirs[1]=()
		echo ${dir#./}

		# For each file
		for file in $(\ls $dir); do
			entry=$dir/$file
			[[ -d $entry ]] && dirs+=($entry)
		done
	done
}

function my-fzf-complete() {
	fzf --height 40% --reverse
}


# --- Widget ---
# Create fzf-magic-complete widget
zle -N fzf-magic-complete
function fzf-magic-complete() {
	setopt localoptions pipefail 2> /dev/null

	# Directory completion for `cd`
	if [[ $LBUFFER =~ '^cd\b' ]]; then
		LBUFFER="${LBUFFER}$(fzf-dirs | my-fzf-complete)"

	# File completion
	else
		LBUFFER="${LBUFFER}$({fzf-gitfiles; fzf-files} | my-fzf-complete)"
	fi

	# TODO: Is this stuff needed?
	# Redraw display
	local ret=$?
	zle redisplay
	typeset -f zle-line-init >/dev/null && zle zle-line-init
	return $ret
}


# --- Aliases ---
alias vif='vi $(fzf)'

