#!/bin/zsh

# --- Backup File ---
timestamp=$(date +%Y%m%d-%H%M%S-Week%U-%a-%T)
backup_dir=$HOME/.tmux/backup/$(hostname --long)
backup_file=$backup_dir/$timestamp.tmux
mkdir -p $backup_dir
exec > >(tee -i $backup_file)

# --- Format ---
window_format='#{session_name} #{window_index} #{window_name} #{window_layout}'
pane_format='#{pane_current_path}'

# --- New Pane ---
prev_session=''
prev_window=''
function new_pane() {
	local session=$1 window=$2 name=$3 dir=$4
	new_pane="    split-window"
	[[ $window != $prev_window ]] && new_pane="  new-window -n $name"
	[[ $session != $prev_session ]] && new_pane="new-session -d -s $session -n $name"
	prev_window=$window
	prev_session=$session
	echo $new_pane -c $dir
}

# --- Generate Backup ---
while read session index name layout; do
	for dir in $(tmux list-panes -t $session:$index -F $pane_format); do
		new_pane $session $index $name $dir
	done
	echo "    select-layout $layout"
done < <(tmux list-windows -a -F $window_format)

