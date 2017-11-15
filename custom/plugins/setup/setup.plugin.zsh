
# --- .zshrc ---
zle -N source-zshrc
function source-zshrc() {
	# TODO: Figure out how to redraw buffer
	#local temp_buffer=$BUFFER
	#BUFFER='sourcing ~/.zshrc file...'
	source ~/.zshrc
	#BUFFER="$temp_buffer"
}
bindkey -M viins "^[[15~" source-zshrc
bindkey -M vicmd "^[[15~" source-zshrc

alias zshrc='source ~/.zshrc'

alias newxauth='xauth add $DISPLAY . $(head -c16 </dev/urandom | xxd -p -u)'

