
ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# --- Ignore Files ---
ignore = Makefile README.md bin windows emacs.d

# --- Get Files/Directories ---
dirs = $(wildcard */)
dirs := $(dirs:%/=%)
files = $(filter-out $(dirs), $(wildcard *))
links = $(addprefix $(HOME)/., $(filter-out $(ignore), $(wildcard *)))

# --- Directories ---
.FISH := $(HOME)/.config/fish

# --- powerline ---
temp := $(shell mktemp -d)
fonts := $(HOME)/.fonts
fontconfig := $(HOME)/.config/fontconfig/conf.d

# --- All ---
all: links bindir fish

# --- Symbolic Links ---
links: $(links)
$(HOME)/.%: $(ROOT_DIR)/%; ln -fs $< $@

# --- bin Directory ---
bindir:
	make -C bin all

# --- bash ---
bash: bash/downloads/git-completion.bash
bash/downloads/git-completion.bash:
	curl -fLo $@ https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# --- fisherman ---
# fish plugin manager
fish: $(.FISH)/functions/fisher.fish
$(.FISH)/functions/fisher.fish:
	curl -fLo $@ https://git.io/fisher

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

# --- Clean ---
clean:
	rm $(links)

