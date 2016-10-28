
# --- Ignore Files ---
ignore = Makefile README.md custom

# --- Get Files/Directories ---
dirs = $(wildcard */)
dirs := $(dirs:%/=%)
files = $(filter-out $(dirs), $(wildcard *))
links = $(addprefix $(HOME)/., $(filter-out $(ignore), $(wildcard *)))

# --- oh-my-zsh ---
zsh = $(HOME)/.oh-my-zsh
plugins := $(wildcard custom/plugins/*/)
plugins := $(addprefix $(zsh)/, $(plugins:%/=%))
themes = $(zsh)/custom/themes

# --- powerline ---
temp := $(shell mktemp -d)
fonts := $(HOME)/.fonts
fontconfig := $(HOME)/.config/fontconfig/conf.d

# --- All ---
all: zsh links vundle

# --- Symbolic Links ---
links: $(links)
$(HOME)/.%: $(PWD)/%; ln -fs $< $@

# --- oh-my-zsh ---
# zsh framework manager
zsh: $(zsh)/oh-my-zsh.sh plugins themes
$(zsh)/oh-my-zsh.sh:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
plugins: $(plugins)
themes: $(themes)
$(plugins) $(themes):
	ln -fs $(@:$(zsh)/%=$(PWD)/%) $@

# --- powerline ---
# Status line plugin for zsh/tmux/vim
powerline: $(HOME)/.local/bin/powerline $(HOME)/.local/share/fonts fonts
$(HOME)/.local/bin/powerline:
	#pip install --user git+git://github.com/powerline/powerline
	#pip install --user powerline-status
$(HOME)/.local/share/fonts:
	git -C $(temp) clone https://github.com/powerline/fonts
	$(temp)/fonts/install.sh

#http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
#fonts: $(fonts)/PowerlineSymbols.otf $(fonts)/fonts.dir $(fonts)/fonts.scale
blah: $(fonts)/PowerlineSymbols.otf
fonts: $(fonts)/fonts.dir $(fonts)/fonts.scale $(fontconfig)/10-powerline-symbols.conf
	xset q | grep -q $(fonts) || xset +fp $(fonts)
	fc-cache -vf $(fonts)
$(fonts)/fonts.dir: $(fonts)/PowerlineSymbols.otf
	mkfontdir $(fonts)
$(fonts)/fonts.scale: $(fonts)/PowerlineSymbols.otf
	mkfontscale $(fonts)
$(fonts)/PowerlineSymbols.otf:
	@mkdir -p $(fonts)
	@wget -P $(fonts) https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
$(fontconfig)/10-powerline-symbols.conf:
	mkdir -p $(fontconfig)
	wget -P $(fontconfig) https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

#wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
#fc-cache -vf ~/.fonts
#mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/


# --- Vundle ---
# vim plugin manager
vundle: $(HOME)/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
$(HOME)/.vim/bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim

# --- Clean ---
clean:
	rm $(links)
	rm $(plugins:%/=%)
	rm $(themes:%/=%)

