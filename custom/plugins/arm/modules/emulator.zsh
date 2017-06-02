
# --- Global Aliases ---
alias -g -- '-velconf'='-conf /home/lsf/scheduler_prod/configs/NAHPCVEL/NAHPCVEL.conf'
alias -g -- '-zs3conf'='-conf /home/lsf/scheduler_prod/configs/NAHPCPRODZS3/NAHPCPRODZS3.conf'

# --- Veloce ---
alias velres='cat /arm/cluster/nahpc/conf/veloce-scheduler.cfg'

# --- Emululation Tools ---
alias emu='mrun +arm/emutools'
alias emuhelp='ls -l $(dirname $(emu which emustat))'
alias velstat='emu velstat'
alias zs3stat='emu zs3stat'
alias velft='emu velfasttrack'
alias zs3ft='emu zs3fasttrack'

