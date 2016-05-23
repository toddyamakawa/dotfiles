
export DEPOT_SETUP_ROOT=/home/todyam01/.setup.zshrc/
source $DEPOT_SETUP_ROOT/init/zsh

alias sitename='hostname -f | \grep -o ..hpc'
alias nahpc='sitename | \grep -q nahpc'
alias euhpc='sitename | \grep -q euhpc'

