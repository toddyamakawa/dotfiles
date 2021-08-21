#!/usr/bin/env bash

# Set permissions
umask 077

# Check SSH directory
SSH_DIR="$HOME/.ssh"
if [[ -d "$SSH_DIR" ]]; then
	echo -e "\e[31;1mWARNING: '$SSH_DIR' already exists!\e[0m"
	echo "Do you wish to continue?"
	select yes_no in "Yes (backup and continue)" "No"; do
		case "$yes_no" in
			Yes*) break;;
			No* ) exit;;
		esac
	done
	echo "Moving '$SSH_DIR' to '$SSH_DIR.backup'..."
	mv "$SSH_DIR" "$SSH_DIR.backup"
fi
mkdir -pv "$SSH_DIR"

# Generate SSH key
echo "Generating key..."
ssh-keygen -f "$SSH_DIR/id_rsa" -N ""
cp $SSH_DIR/id_rsa.pub $SSH_DIR/authorized_keys

# SSH config
echo "Generating $SSH_DIR/config file..."
cat >$SSH_DIR/config << SSH_CONFIG
Host *
ForwardAgent yes
ForwardX11 yes
ServerAliveInterval 120
StrictHostKeyChecking no
SSH_CONFIG

# Fix home directory permissions
chmod +x $HOME
chmod g-w $HOME

