
ignore = Makefile README.md
files = $(filter-out $(ignore), $(wildcard *))
dotfiles += $(files:%=.%)

install: $(dotfiles)
	#$(files)
	#$(dotfiles)

%:
	if [[ -d ~/$@ ]]; then mv ~/$@ ~/$@.bak; fi
	ln -fs $(PWD)/$(@:.%=%) ~/$@

vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

