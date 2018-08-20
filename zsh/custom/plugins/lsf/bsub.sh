#!/usr/bin/env bash
script=$(readlink -f $BASH_SOURCE)
here=$(dirname $script)

LSB_DEFAULT_RESOURCE='select[rhe6 && x86_64 && os64]'
LSB_DEFAULT_JOBDESCRIPTION=svos-build
LSB_DEFAULT_RUNLIMIT=144:00
LSB_DEFAULT_RUNTIME=144:00
LSB_DEFAULT_MEMORY=8192000
LSB_DEFAULT_QUEUE=PD
LSB_DEFAULT_OUTFILE='output.%J.log'

declare -A ARGV
declare -a ARGS
while [[ $# -ge 1 ]]; do
	arg="$1" && shift
	case "$arg" in
		--) COMMAND="$@"; break 2;;
		-*) [[ "$1" =~ ^- ]] && ARGV["$arg"]="" || { ARGV["$arg"]="$1"; shift; };;
		*) ARGS=("${ARGS[@]}" "$arg");;
	esac
done

[[ -z "${ARGV[-P]}" ]]  && ARGV[-P]=$LSB_DEFAULTPROJECT
[[ -z "${ARGV[-R]}" ]]  && ARGV[-R]="'$LSB_DEFAULT_RESOURCE'"
[[ -z "${ARGV[-Jd]}" ]] && ARGV[-Jd]="$LSB_DEFAULT_JOBDESCRIPTION"
[[ -z "${ARGV[-W]}" ]]  && ARGV[-W]="$LSB_DEFAULT_RUNLIMIT"
[[ -z "${ARGV[-We]}" ]] && ARGV[-We]="$LSB_DEFAULT_RUNTIME"
[[ -z "${ARGV[-M]}" ]]  && ARGV[-M]="$LSB_DEFAULT_MEMORY"
[[ -z "${ARGV[-q]}" ]]  && ARGV[-q]="$LSB_DEFAULT_QUEUE"
[[ -z "${ARGV[-o]}" && -z "${ARGV[-oo]}" ]] && ARGV[-oo]="$LSB_DEFAULT_OUTFILE"

bsub='bsub'
for arg in "${!ARGV[@]}"; do
	bsub+=" $arg ${ARGV[$arg]}"
done

echo "$bsub $COMMAND"
eval "$bsub $COMMAND"

