#!/bin/sh
sleep 60
bjobs -UF $1 | \
	awk 'BEGIN{RS=", +|;?\n"}{$1=$1;print}' | \
	mail -s "Job $1 complete" $(whoami)@arm.com
