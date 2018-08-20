
# --- Environment Variables ---
export ARM_IP_LIBRARY=http://cam-svn2.cambridge.arm.com/svn/pdcss/ip/arm_ip_library
export ARM_IP_WAREHOUSE=/arm/warehouse/ARM_IP
export ARM_IP_REPOSITORY=/projects/pd/kits/arm_ip_repository

# --- SVN ---
alias svn_ip='svn ls $ARM_IP_LIBRARY'
alias svn_interconnect='svn ls $ARM_IP_LIBRARY/e_interconnect_f4/tags'
alias svn_porter='svn ls $ARM_IP_LIBRARY/porter/tags'

