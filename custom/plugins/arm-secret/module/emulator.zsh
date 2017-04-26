
# --- fasttrack ---
function fasttrack() {
	/arm/warehouse/TOEF/scheduler/0.1/83/linux-x86_64/bin/fasttrack $@
}

# --- Global Aliases ---
alias -g -- '-velconf'='-conf /home/lsf/scheduler_prod/configs/NAHPCVEL/NAHPCVEL.conf'
alias -g -- '-zs3conf'='-conf /home/lsf/scheduler_prod/configs/NAHPCPRODZS3/NAHPCPRODZS3.conf'

# --- Veloce ---
alias velres='cat /arm/cluster/nahpc/conf/veloce-scheduler.cfg'

