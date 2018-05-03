#!/usr/bin/env bash

# Set permissions
umask 077

# SSH directory
SSH_DIR=~/.ssh
[[ -d $SSH_DIR ]] && { echo "$SSH_DIR already exists!"; exit 1; }
mkdir -pv $SSH_DIR

# Generate SSH key
echo "Generating key..."
ssh-keygen -f $SSH_DIR/id_rsa -N ""
cp $SSH_DIR/id_rsa.pub $SSH_DIR/authorized_keys

# SSH config
echo "Generating $SSH_DIR/config file..."
cat >$SSH_DIR/config << SSH_CONFIG
Host *
StrictHostKeyChecking no
ForwardAgent yes
ForwardX11 yes
Host ds-gerrit
	HostName ds-gerrit.euhpc.arm.com
SSH_CONFIG

