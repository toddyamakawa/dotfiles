#!/bin/zsh

# --- Backup File ---
timestamp=$(date +%Y.%m.%d-%H.%M.%S)
backup_dir=$HOME/.tmux/backup
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
	new_pane="split-window"
	[[ $2 != $prev_window ]] && { new_pane="new-window -n $3"; prev_window=$2; }
	[[ $1 != $prev_session ]] && new_pane="new-session -d -s $1"
	prev_session=$session
	echo $new_pane -c $4
}

# --- Generate Backup ---
while read window; do
	session=$(awk '{print $1}' <(echo $window))
	index=$(  awk '{print $2}' <(echo $window))
	name=$(   awk '{print $3}' <(echo $window))
	layout=$( awk '{print $4}' <(echo $window))
	for dir in $(tmux list-panes -t $session:$index -F $pane_format); do
		new_pane $session $index $name $dir
	done
	echo select-layout $layout
done < <(tmux list-windows -a -F $window_format)

