#!/usr/bin/env bash

# Immediately exit on failure
set -e

# Run as root
[[ $EUID == 0 ]] || exec sudo $0

# Install epiphany-browser
apt-get install -y x11-utils software-properties-common
apt-get dist-upgrade
add-apt-repository ppa:gnome3-team/gnome3
add-apt-repository ppa:gnome3-team/gnome3-staging
apt-get update -y
apt-get upgrade
apt-get install -y epiphany-browser gnome-keyring gnome-themes-standard

