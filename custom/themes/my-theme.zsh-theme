
# vi: syntax=zsh

# --- Evaluate $PROMPT ---
setopt PROMPT_SUBST

# --- Colors ---
red="%{$fg_no_bold[red]%}"
yellow="%{$fg_no_bold[yellow]%}"
green="%{$fg_no_bold[green]%}"
blue="%{$fg_no_bold[blue]%}"
cyan="%{$fg_no_bold[cyan]%}"
magenta="%{$fg_no_bold[magenta]%}"
black="%{$fg_no_bold[black]%}"
white="%{$fg_no_bold[white]%}"

# --- Bold Colors ---
red_bold="%{$fg_bold[red]%}"
yellow_bold="%{$fg_bold[yellow]%}"
green_bold="%{$fg_bold[green]%}"
blue_bold="%{$fg_bold[blue]%}"
cyan_bold="%{$fg_bold[cyan]%}"
magenta_bold="%{$fg_bold[magenta]%}"
black_bold="%{$fg_bold[black]%}"
white_bold="%{$fg_bold[white]%}"

# --- Reset Color ---
no_color="%{$reset_color%}"

# =============
#    $PROMPT
# =============

# --- Hostname/JobID ---
# Return Job ID for interactive LSF shells
# Return hostname otherwise
function prompt_host() {
	[[ -n $LSB_BATCH_JID ]] && echo "@$yellow_bold$LSB_BATCH_JID" || echo "@%m";
}

# --- Path ---
# Use Blue for paths with username
# Use Cyan for paths without username
function prompt_path() {
	local c=$blue_bold p=${PWD/$HOME/\~}
	[[ $PWD =~ $(whoami) ]] || c=$cyan_bold
	echo $c${p##*/}
}

# --- Permission ---
function prompt_permission() {
	local a=$(stat -c %a .)
	local u=$blue_bold$a[-3]
	local g=$blue_bold$a[-2]
	local o=$blue_bold$a[-1]
	[[ $(whoami) == $(stat -c %U .) ]] || u=$red_bold$a[-3]
	groups | grep -q $(stat -c %G .) || g=$red_bold$a[-2]
	[[ $(whoami) == $(stat -c %G .) ]] && g=$magenta_bold$a[-2]
	echo $u$g$o
}

# --- Vi-Mode $ ---
function prompt_vimode() {
	[[ $KEYMAP == vicmd ]] && echo "$cyan_bold\$" || echo "$blue_bold\$"
}

# --- Pass/Fail Faces ---
prompt_pass="$green_bold:)"
prompt_fail="$red_bold:("

# --- Define $PROMPT ---
PROMPT="${blue_bold}[%n"
PROMPT+="$(prompt_host) "
PROMPT+='$(prompt_path) '
PROMPT+='$(prompt_permission) '
PROMPT+="%(?.$prompt_pass.$prompt_fail)"
PROMPT+="${blue_bold}]"
PROMPT+='$(prompt_vimode)'
PROMPT+="${no_color} "


# =============
#    $RPROMPT
# =============

function rprompt_git_branch() {
	local branch=$(git rev-parse --abbrev-ref HEAD)
	local clean=$green
	git diff-index --quiet HEAD || clean=$red
	echo "$clean$branch"
}

function rprompt_git_commits() {
	local ahead=$(git status -sb | sed -n 's/.*ahead \([0-9]\+\).*/\1/p')
	local behind=$(git status -sb | sed -n 's/.*behind \([0-9]\+\).*/\1/p')
	local commits=""
	[[ -n $ahead ]] && commits+="$yellow+$ahead "
	[[ -n $behind ]] && commits+="$red-$behind "
	echo $commits
}

function rprompt_git() {
	git rev-parse --git-dir &> /dev/null || return
	modified_count=$(git diff --name-only | wc -l)
	current_sha=$(git rev-parse --short HEAD)
	upstream_sha=$(git rev-parse --short @{u})
	echo "$(rprompt_git_branch) $(rprompt_git_commits)"
}

function rprompt_time() {
	echo "${blue}$(date +%H:%M:%S)${no_color}"
}

RPROMPT='$(rprompt_git)$(rprompt_time)'

# =====================
#    PROMPT SETTINGS
# =====================

# Redraw prompt on terminal resize
function TRAPWINCH() {
  zle && zle reset-prompt
}

function zle-keymap-select() { zle reset-prompt; }
zle -N zle-keymap-select
zle -N edit-command-line

