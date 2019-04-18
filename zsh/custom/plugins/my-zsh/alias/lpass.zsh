
alias lp='lpass'
alias lpstat='lpass status'
alias lplogin='lpass login'

function lpfzf() {
	lpass status || return 1
	lpass ls --long | fzf
}

