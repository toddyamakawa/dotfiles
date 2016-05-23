
# --- VNC ---
alias vnc='ps -ef | awk '"'"'{print $11, $1}'"'"' | grep `hostname`: | sed "s/`hostname`://g" | sort -n'
alias newvnc='vncserver -geometry 1920x1015'

