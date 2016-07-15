
# Select keymap vi
bindkey -v


# =================
#    INSERT MODE
# =================

# Ctrl-j and Ctrl-k to search history
# search-history-forward
# search-history-backward
bindkey -M viins '^J' down-line-or-search
bindkey -M viins '^K' up-line-or-search
#bindkey -M viins '^J' down-line-or-history
#bindkey -M viins '^K' up-line-or-history

# jj or kk to enter command mode
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M viins 'kk' vi-cmd-mode
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

# FIXME: Ctrl-backspace to delete word backwards
#bindkey -M viins '^\b' backward-kill-word

# ==================
#    COMMAND MODE
# ==================

# Move to beginning/end of line
bindkey -M vicmd 'H' vi-beginning-of-line
bindkey -M vicmd 'L' vi-end-of-line

# Use Vim to edit command line
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

