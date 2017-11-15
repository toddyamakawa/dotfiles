
# --- Source ---
source ~/.fzf.zsh


# --- Key Bindings ---

#bindkey -M vicmd '^[c' fzf-cd-widget

bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

bindkey -M vicmd '^T' fzf-file-widget
bindkey -M viins '^T' fzf-file-widget


# --- Aliases ---
alias vif='vi $(fzf)'

