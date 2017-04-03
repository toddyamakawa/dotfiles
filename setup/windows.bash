#!sudo /bin/bash
apt-get install -y zsh git make
git clone https://github.com/toddyamakawa/dotfiles $HOME/dotfiles
make -C $HOME/dotfiles

apt-get install python-setuptools python-dev build-essential
easy_install pip
pip install --upgrade virtualenv
pip install --user git+git://github.com/Lokaltog/powerline

