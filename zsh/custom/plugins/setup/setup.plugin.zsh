
# --- .zshrc ---
zle -N source-zshrc
function source-zshrc() {
	#local temp_buffer=$BUFFER
	#BUFFER='sourcing ~/.zshrc file...'

	# TODO: Figure out how to redraw buffer
	# Attempt 1 failure
	#zle redisplay
	#typeset -f zle-line-init >/dev/null && zle zle-line-init

	source ~/.zshrc
	#BUFFER="$temp_buffer"
}
bindkey -M viins "^[[15~" source-zshrc
bindkey -M vicmd "^[[15~" source-zshrc

alias zshrc='source ~/.zshrc'

alias newxauth='xauth add $DISPLAY . $(head -c16 </dev/urandom | xxd -p -u)'

