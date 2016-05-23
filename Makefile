
ignore = Makefile README.md
files = $(filter-out $(ignore), $(wildcard *))
dotfiles += $(files:%=.%)
exists = $(shell [[ -e $@ ]] && echo 1 || echo 0)

install: $(dotfiles)

vim-plug: ~/.vim/autoload/plug.vim

~/.vim/autoload/plug.vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

%:
	@if [[ -e $(@:.%=%) ]]; then \
		ln -fs $(PWD)/$(@:.%=%) ~/$@; \
		echo "Created symlink: ~/$@"; \
	fi

