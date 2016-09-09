
# --- VNC ---
alias vncls='ps -ef | sed -n '"'"'s/^\(\w\+\).*Xvnc\s\+:\([0-9]\+\).*$/\2 \1/gp'"'"' | sort -n'
alias vncnew='vncserver -geometry 1920x1015'

# --- vncconfig ---
alias vncconfig='vncconfig -nowin &'

