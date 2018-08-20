
# --- Global Aliases ---
alias -g -- '-velconf'='-conf /home/lsf/scheduler_prod/configs/NAHPCVEL/NAHPCVEL.conf'
alias -g -- '-zs3conf'='-conf /home/lsf/scheduler_prod/configs/NAHPCPRODZS3/NAHPCPRODZS3.conf'

# --- Veloce ---
alias velres='cat /arm/cluster/nahpc/conf/veloce-scheduler.cfg'

# --- Emululation Tools ---
alias emu='mrun +arm/emutools'
alias emuhelp='ls -l $(dirname $(emu which emustat))'
alias veljobs='emu veljobs -user all'
alias zs3jobs='emu zs3jobs -user all'
alias velstat='emu velstat'
alias zs3stat='emu zs3stat'
alias strstat='emu strstat'
alias velft='emu velfasttrack'
alias zs3ft='emu zs3fasttrack'

# Find defunct processes on emulation hosts
function emu_zombie() {
	local -U hosts
	hosts=($(bhosts | awk '/^eh-/{print $1}'))
	for host in $hosts; do
		ssh $host ps aux | awk -v host=$host '{print host, $0}' | grep defunct
	done
}

