#!/usr/bin/env bash

# Immediately exit on failure
set -e

# Run as root
[[ $EUID == 0 ]] || exec sudo $0

# Install powerline
apt-get install python-setuptools python-dev
easy_install pip
pip install --upgrade virtualenv
pip install --user git+git://github.com/Lokaltog/powerline

