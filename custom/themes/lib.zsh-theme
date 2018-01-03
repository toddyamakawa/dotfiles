
local here=${0:h}
source $here/colors.zsh-theme
source $here/directory.zsh
source $here/display.zsh
source $here/git.zsh
source $here/host.zsh
source $here/pre.zsh
source $here/prompt.zsh
source $here/time.zsh

# --- Prompt Performance ---
function pperf() {
	local start_ms=$(date +%s%3N)
	build_prompt > /dev/null
	echo "build_prompt: $(($(date +%s%3N)-$start_ms))"
	start_ms=$(date +%s%3N)
	build_rprompt > /dev/null
	echo "build_rprompt: $(($(date +%s%3N)-$start_ms))"
}

# --- Set Title ---
function _set-title() {
	print -Pn "\e]0;$@\a"
}

