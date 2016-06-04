
ignore = Makefile README.md
files = $(filter-out $(ignore), $(wildcard *))
dotfiles += $(files:%=.%)
exists = $(shell [[ -e $@ ]] && echo 1 || echo 0)

links: $(dotfiles)

install: oh-my-zsh vundle

# --- oh-my-zsh ---
oh-my-zsh: ~/.oh-my-zsh/oh-my-zsh.sh
~/.oh-my-zsh/oh-my-zsh.sh:
	sh -c $(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)

# --- Vundle ---
# vim plugin manager
vundle: ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
~/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


%:
	@if [[ -e $(@:.%=%) ]]; then \
		ln -fs $(PWD)/$(@:.%=%) ~/$@; \
		echo "Created symlink: ~/$@"; \
	fi

