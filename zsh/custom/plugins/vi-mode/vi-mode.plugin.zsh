
# ========================
#    VI KEYMAP SETTINGS
# ========================

# Select vi keymap
bindkey -v

# Turn two-key key-bindings into a chorded key-bindings
export KEYTIMEOUT=2


# ==================
#    ZSH COMMANDS
# ==================
function zkeys() {
	for keymap in $(bindkey -l); do
		bindkey -M $keymap | awk '{$1="['$keymap'] "$1; print}'
	done
}


# =============
#    WIDGETS
# =============

zle -N vi-up-begin
function vi-up-begin() {
	zle up-line-or-history
	zle vi-beginning-of-line
}

zle -N vi-up-end
function vi-up-end() {
	zle up-line-or-history
	zle vi-add-eol
}

zle -N vi-xclip-paste
function vi-xclip-paste() {
	#[[ -e ${TMUX%%,*} ]] && tmux show-buffer | xclip
	LBUFFER="$LBUFFER$(xclip -o)"
}

zle -N clear-on-empty-buffer
function clear-on-empty-buffer() {
	[[ -z $BUFFER ]] && zle clear-screen || zle accept-line
}

zle -N vi-my-backward-kill-word
function vi-my-backward-kill-word() {
	# Tabs might break this
	LBUFFER=$(echo $LBUFFER | sed 's:/\?[^ /]\+\s*$::')
}


# =========================
#    COMMAND/INSERT MODE
# =========================

# Clear screen if buffer is empty
#bindkey -M viins "^M" clear-on-empty-buffer
#bindkey -M vicmd "^M" clear-on-empty-buffer


# =================
#    INSERT MODE
# =================

# Ctrl-f to enter vicmd mode
bindkey -M viins '^F' vi-cmd-mode

# Ctrl-j and Ctrl-k to search history using history-substring-search plugin
bindkey -M viins "^J" history-substring-search-down
bindkey -M viins "^K" history-substring-search-up

# Ctrl-h to delete words
bindkey -M viins "^H" vi-my-backward-kill-word

# [Alt-p] to paste
bindkey -M viins '^[p' vi-xclip-paste

# FIXME: Ctrl-backspace to delete word backwards, doesn't work in gnome-terminal
#bindkey -M viins '^?' backward-kill-word
#bindkey -M viins "^?" backward-kill-word
#bindkey -M viins "^?" backward-kill-word
#bindkey -M viins '^[^?' backward-kill-word


# ==================
#    COMMAND MODE
# ==================

# Move to beginning/end of line
bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line

# Use Vim to edit command line
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line


# =====================
#    MENU SELCT MODE
# =====================
bindkey -M menuselect 'k' up-line-or-history
bindkey -M menuselect 'j' down-line-or-history
bindkey -M menuselect 'l' forward-char
bindkey -M menuselect 'h' backward-char

