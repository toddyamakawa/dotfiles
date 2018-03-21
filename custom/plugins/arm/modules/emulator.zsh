
# --- Global Aliases ---
alias -g -- '-velconf'='-conf /home/lsf/scheduler_prod/configs/NAHPCVEL/NAHPCVEL.conf'
alias -g -- '-zs3conf'='-conf /home/lsf/scheduler_prod/configs/NAHPCPRODZS3/NAHPCPRODZS3.conf'
alias -g -- '-stratoconf'='-conf /home/lsf/scheduler_prod/configs/NAHPCPRODSTR0/NAHPCPRODSTR0.conf'

# --- Veloce ---
alias velres='cat /arm/cluster/nahpc/conf/veloce-scheduler.cfg'

# --- Emululation Tools ---
alias emutools='mrun +arm/emutools'
alias emuhelp='ls -l $(dirname $(emutools which emustat))'
alias veljobs='emutools veljobs -user all'
alias zs3jobs='emutools zs3jobs -user all'
alias velstat='emutools velstat'
alias zs3stat='emutools zs3stat'
alias velft='emutools velfasttrack'
alias zs3ft='emutools zs3fasttrack'

# Find defunct processes on emulation hosts
function emu_zombie() {
	local -U hosts
	hosts=($(bhosts | awk '/^eh-/{print $1}'))
	for host in $hosts; do
		ssh $host ps aux | awk -v host=$host '{print host, $0}' | grep defunct
	done
}

