
ignore = Makefile README.md
files = $(filter-out $(ignore), $(wildcard *))
dotfiles += $(files:%=.%)
exists = $(shell [[ -e $@ ]] && echo 1 || echo 0)

links: $(dotfiles)

install: oh-my-zsh vim-plug

oh-my-zsh: ~/.oh-my-zsh/oh-my-zsh.sh

vim-plug: ~/.vim/autoload/plug.vim

~/.oh-my-zsh/oh-my-zsh.sh:
	sh -c $(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

%:
	@if [[ -e $(@:.%=%) ]]; then \
		ln -fs $(PWD)/$(@:.%=%) ~/$@; \
		echo "Created symlink: ~/$@"; \
	fi

