
ignore = Makefile README.md

dirs = $(wildcard */)
dirs := $(dirs:%/=%)

files = $(filter-out $(dirs) $(ignore), $(wildcard *))

#links = $(dotfiles:%=~/.%)
#links = $(addprefix ~/., $(files))
links = $(addprefix $(HOME)/., $(files))

links: $(links)

install: oh-my-zsh vundle

# --- oh-my-zsh ---
oh-my-zsh: ~/.oh-my-zsh/oh-my-zsh.sh
~/.oh-my-zsh/oh-my-zsh.sh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# --- Vundle ---
# vim plugin manager
vundle: ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
~/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vimcolors:
	mkdir -p ~/.vim/colors
	ln -s $(wildcard ~/.vim/bundle/*/colors/*.vim) ~/.vim/colors

$(links):
	ln -fsT $(PWD)/$(@:$(HOME)/.%=%) $(@)

clean:
	rm $(links)

