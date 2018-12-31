
function tsplit-ssh() {
	tmux split-window -v ssh $1
	tmux select-layout -E
}

function twindow-ssh-nahpc() {
	tmux new-window -n "nahpc" ssh login1.nahpc.arm.com
	tsplit-ssh login2.nahpc.arm.com
	tsplit-ssh login3.nahpc.arm.com
	tsplit-ssh login4.nahpc.arm.com
	tsplit-ssh login5.nahpc.arm.com
	tsplit-ssh login6.nahpc.arm.com
	tsplit-ssh login7.nahpc.arm.com
	tsplit-ssh login8.nahpc.arm.com
	tsplit-ssh login9.nahpc.arm.com
	tsplit-ssh login10.nahpc.arm.com
	tmux select-layout tiled
}

function twindow-ssh-nahpc2() {
	tmux new-window -n "nahpc2" ssh login1.nahpc2.arm.com
	tsplit-ssh login2.nahpc2.arm.com
	tsplit-ssh login3.nahpc2.arm.com
	tsplit-ssh login4.nahpc2.arm.com
	tmux select-layout tiled
}

