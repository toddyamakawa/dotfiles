
ignore = Makefile README.md

dirs = $(wildcard */)
dirs := $(dirs:%/=%)

files = $(filter-out $(dirs) $(ignore), $(wildcard *))

links = $(addprefix $(HOME)/., $(files))

links: $(links)

install: oh-my-zsh vundle

# --- oh-my-zsh ---
oh-my-zsh: $(HOME)/.oh-my-zsh/oh-my-zsh.sh
$(HOME)/.oh-my-zsh/oh-my-zsh.sh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# --- Vundle ---
# vim plugin manager
vundle: $(HOME)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
$(HOME)/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim

vimcolors:
	mkdir -p $(HOME)/.vim/colors
	ln -s $(wildcard $(HOME)/.vim/bundle/*/colors/*.vim) $(HOME)/.vim/colors

$(links):
	ln -fsT $(PWD)/$(@:$(HOME)/.%=%) $(@)

clean:
	rm $(links)

