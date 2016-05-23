#
# vi: syntax=zsh

# Evaluate $PROMPT
setopt PROMPT_SUBST

prompt_pass="%{$fg_bold[green]%}:)"
prompt_fail="%{$fg_bold[red]%}:("

prompt_host() { [[ -n $LSB_BATCH_JID ]] && echo "@%{$fg[yellow]%}$LSB_BATCH_JID" || echo "@%m"; }
prompt_path() {
	local p=${PWD##*/}
	[[ $PWD == $HOME ]] && p="~"
	pwd | grep -q $(whoami) && echo $p || echo $fg[yellow]$p
}
prompt_permission() {
	local a=$(stat -c %a .)
	[[ $(whoami) == $(stat -c %U .) ]] && u=$fg[blue]$a[-3] || u=$fg[red]$a[-3]
	groups | grep -q $(stat -c %G .) && g=$fg[blue]$a[-2] || g=$fg[red]$a[-2]
	echo $u$g$a[-1]
}

PROMPT="%{$fg_bold[blue]%}[%n"
PROMPT+="$(prompt_host) "
PROMPT+="\$(prompt_path) "
PROMPT+="\$(prompt_permission) "
PROMPT+="%(?.$prompt_pass.$prompt_fail)"
PROMPT+="%{$fg_bold[blue]%}]\$%{$reset_color%} "


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

