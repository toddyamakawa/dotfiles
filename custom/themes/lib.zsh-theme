
local here=${0:h}
source $here/colors.zsh-theme
source $here/directory.zsh
source $here/display.zsh
source $here/git.zsh
source $here/prompt.zsh
source $here/time.zsh


# --- Set Title ---
function set-title() {
	print -Pn "\e]0;$@\a"
}

