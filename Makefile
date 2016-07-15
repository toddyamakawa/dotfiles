
# --- Ignore Files ---
ignore = Makefile README.md

# --- Get Files/Directories ---
dirs = $(wildcard */)
dirs := $(dirs:%/=%)
files = $(filter-out $(dirs), $(wildcard *))
links = $(addprefix $(HOME)/., $(filter-out $(ignore), $(wildcard *)))

# --- Symbolic Links ---
links: $(links)
$(links):
	ln -fs $(PWD)/$(@:$(HOME)/.%=%) $(@)

install: zsh vundle

# --- oh-my-zsh ---
zsh: oh-my-zsh
oh-my-zsh: $(HOME)/.oh-my-zsh/oh-my-zsh.sh
$(HOME)/.oh-my-zsh/oh-my-zsh.sh:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# --- Vundle ---
# vim plugin manager
vundle: $(HOME)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
$(HOME)/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim

# --- Clean ---
clean:
	rm $(links)

