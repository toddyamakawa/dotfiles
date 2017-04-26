
local here=${0:h}
source $here/arm-zsh-setup.zsh
source_files $here/module/*

# --- Site ---
alias sitename="hostname -f | sed 's/.*\.\([^.]\+\)\.arm\.com/\1/'"
alias nahpc='sitename | \grep -q nahpc'
alias euhpc='sitename | \grep -q euhpc'

alias getquota=/usr/local/bin/getquota
alias projinfo='projinfo 2>/dev/null'
function armdisk() {
	mount \
		| perl -pe 's/^(\S+arm.com):(\S+).*/\\\\\1\2/' \
		| sed -e 's/armhome/home/' \
		-e 's:/:\\:g' \
		-e 's:\\ifs::g'
}

# --- Environment Variables ---
euhpc && [[ -z $LSB_BATCH_JID ]] && export LSB_DEFAULTPROJECT=PJ01384
nahpc && [[ -z $LSB_BATCH_JID ]] && export LSB_DEFAULTPROJECT=PJ01384DEFAULT
nahpc && module load mosh/mosh/1.2.4

# --- Porter ---
#export PROJ_HOME=/projects/ssg/pj01384_porter/todyam01/porter
#export WORK_DIR=/arm/projectscratch/ssg/pj01384_porter/todyam01/porter
#source $PROJ_HOME/logical/shared/tools/bin/porter_rtl_setup_bash

# --- Mail ---
alias mailv='vi /var/spool/mail/$(whoami)'
function mailme { eval mail -s "'$@'" $(whoami)@arm.com; }
function execmail { mailme "$@" < <($@ 2>&1); }

