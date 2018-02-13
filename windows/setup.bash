#!/usr/bin/sudo /bin/bash
script=$(readlink -f $0)
here=$(dirname $script)

apt-get install -y zsh git make
git clone https://github.com/toddyamakawa/dotfiles $HOME/dotfiles
make -C $HOME/dotfiles

apt-get install python-setuptools python-dev build-essential x11-utils
easy_install pip
pip install --upgrade virtualenv
pip install --user git+git://github.com/Lokaltog/powerline

