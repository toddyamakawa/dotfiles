
# --- Ignore Files ---
ignore = Makefile README.md bin windows
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# --- Get Files/Directories ---

dirs = $(wildcard */)
dirs := $(dirs:%/=%)
files = $(filter-out $(dirs), $(wildcard *))
links = $(addprefix $(HOME)/., $(filter-out $(ignore), $(wildcard *)))

# --- oh-my-zsh ---
ZSH = $(HOME)/.oh-my-zsh
plugins := $(wildcard custom/plugins/*/)
plugins := $(addprefix $(ZSH)/, $(plugins:%/=%))
themes = $(ZSH)/custom/themes

# --- Directories ---
.FISH := $(HOME)/.config/fish
.TMUX := $(HOME)/.tmux
.VIM := $(HOME)/.vim
.ZSH := $(HOME)/.oh-my-zsh

# --- powerline ---
temp := $(shell mktemp -d)
fonts := $(HOME)/.fonts
fontconfig := $(HOME)/.config/fontconfig/conf.d

# --- All ---
#all: links bindir zshrc fish vim-plug
all: links bindir zshrc vim-plug

# --- Symbolic Links ---
links: $(links)
$(HOME)/.%: $(ROOT_DIR)/%; ln -fs $< $@

# --- bin Directory ---
bindir:
	make -C bin all

# --- bin Directory ---
bindir:
	make -C bin all

# --- oh-my-zsh ---
# zsh plugin manager
zshrc: $(.ZSH)/oh-my-zsh.sh
$(.ZSH)/oh-my-zsh.sh:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# --- fisherman ---
# fish plugin manager
fish: $(.FISH)/functions/fisher.fish
$(.FISH)/functions/fisher.fish:
	curl -fLo $@ https://git.io/fisher

# --- vim-plug ---
# vim plugin manager
vim-plug: $(.VIM)/autoload/plug.vim
	vim +PlugInstall +qall
$(.VIM)/autoload/plug.vim: $(.VIM)
	curl -fLo $@ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# --- tpm ---
# tmux plugin manager
tpm: $(.TMUX) $(.TMUX)/plugins/tpm
	tmux run-shell $(.TMUX)/plugins/tpm/bin/clean_plugins
	tmux run-shell $(.TMUX)/plugins/tpm/bin/install_plugins
	tmux run-shell '$(.TMUX)/plugins/tpm/bin/update_plugins all'
$(.TMUX)/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm $(.TMUX)/plugins/tpm

# --- tpm ---
# tmux plugin manager
tpm: $(.TMUX) $(.TMUX)/plugins/tpm
	tmux run-shell $(.TMUX)/plugins/tpm/bindings/clean_plugins
	tmux run-shell $(.TMUX)/plugins/tpm/bindings/install_plugins
	tmux run-shell $(.TMUX)/plugins/tpm/bindings/update_plugins
$(.TMUX)/plugins/tpm:
	git clone https://github.com/tmux-plugins/tpm $(.TMUX)/plugins/tpm

# --- Powerline Font ---
fonts: $(fonts)/fonts.dir $(fonts)/fonts.scale $(fontconfig)/10-powerline-symbols.conf
	cp $(fonts)/fonts.scale $(fonts)/fonts.dir
	xset q | grep -q $(fonts) || xset +fp $(fonts)
	fc-cache -fv $(fonts)
$(fonts)/fonts.dir: $(fonts)/PowerlineSymbols.otf
	mkfontdir $(fonts)
$(fonts)/fonts.scale: $(fonts)/PowerlineSymbols.otf
	mkfontscale $(fonts)
$(fonts)/PowerlineSymbols.otf:
	@mkdir -p $(@D)
	@wget -O $@ https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
$(fontconfig)/10-powerline-symbols.conf:
	@mkdir -p $(@D)
	@wget -O $@ https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

# --- Tmux Plugins ---
# vim plugin manager
tpm: $(HOME)/.tmux/plugins/tpm
$(HOME)/.tmux/plugins/tpm:
	@mkdir -p $(HOME)/.tmux/plugins
	git clone https://github.com/tmux-plugins/tpm $@


# --- Clean ---
clean:
	rm $(links)

