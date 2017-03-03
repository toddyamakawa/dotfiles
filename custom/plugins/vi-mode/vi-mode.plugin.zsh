
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
	xclip -o | xargs echo -n
}

# =================
#    INSERT MODE
# =================

# Ctrl-j and Ctrl-k to search history
#bindkey -M viins '^J' down-line-or-search
#bindkey -M viins '^K' up-line-or-search
#bindkey -M viins '^J' down-line-or-history
#bindkey -M viins '^K' up-line-or-history
bindkey -M viins '^J' history-search-forward
bindkey -M viins '^K' history-search-backward
#bindkey -M viins '^J' history-incremental-search-forward
#bindkey -M viins '^K' history-incremental-search-backward

# [j+k] to enter vicmd mode
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

# [k+h] to go up and to the beginning of the line
bindkey -M viins 'kh' vi-up-begin
bindkey -M viins 'hk' vi-up-begin

# [k+l] to go up and to the end of the line
bindkey -M viins 'kl' vi-up-end
bindkey -M viins 'lk' vi-up-end

# [o+p] to paste
bindkey -M viins 'op' vi-xclip-paste
bindkey -M viins 'po' vi-xclip-paste

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

