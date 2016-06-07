
# vi: syntax=zsh

# Evaluate $PROMPT
setopt PROMPT_SUBST

# Colors
red="%{$fg[red]%}"
yellow="%{$fg[yellow]%}"
blue="%{$fg[blue]%}"

# Bold Colors
red_bold="%{$fg_bold[green]%}"
green_bold="%{$fg_bold[green]%}"
blue_bold="%{$fg_bold[blue]%}"

# Pass/Fail string
prompt_pass="$green_bold:)"
prompt_fail="$red_bold:("

# Prompt string generators
prompt_host() { [[ -n $LSB_BATCH_JID ]] && echo "@$yellow$LSB_BATCH_JID" || echo "@%m"; }
prompt_path() {
	local p=${PWD##*/}
	[[ $PWD == $HOME ]] && p="~"
	pwd | grep -q $(whoami) && echo $p || echo $yellow$p
}
prompt_permission() {
	local a=$(stat -c %a .)
	[[ $(whoami) == $(stat -c %U .) ]] && u=$blue$a[-3] || u=$red$a[-3]
	groups | grep -q $(stat -c %G .) && g=$blue$a[-2] || g=$red$a[-2]
	echo $u$g$a[-1]
}

# Set prompt
PROMPT="${blue_bold}[%n"
PROMPT+="$(prompt_host) "
PROMPT+="\$(prompt_path) "
PROMPT+="\$(prompt_permission) "
PROMPT+="%(?.$prompt_pass.$prompt_fail)"
PROMPT+="${blue_bold}]\$%{$reset_color%} "

# Redraw prompt on terminal resize
function TRAPWINCH() {
  zle && zle reset-prompt
}

function zle-keymap-select() { zle reset-prompt; }
zle -N zle-keymap-select
zle -N edit-command-line

MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"

function vi_mode_prompt_info() {
	echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

RPROMPT='[zsh]$(vi_mode_prompt_info)'

