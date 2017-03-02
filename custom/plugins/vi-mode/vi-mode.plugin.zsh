
# ===============
#    VI KEYMAP
# ===============
bindkey -v


# ==================
#    ZSH COMMANDS
# ==================
function zkeys() {
	for keymap in $(bindkey -l); do
		bindkey -M $keymap | awk '{$1="['$keymap'] "$1; print}'
	done
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

# Hit 'j' and 'k' simultaneously to enter vicmd mode
export KEYTIMEOUT=2
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

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

