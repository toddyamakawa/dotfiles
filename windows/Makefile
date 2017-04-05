
# --- Get Files/Directories ---
#dirs = $(wildcard */)
#dirs := $(dirs:%/=%)
#files = $(filter-out $(dirs), $(wildcard *))
#links = $(addprefix $(HOME)/., $(filter-out $(ignore), $(wildcard *)))
#startup = $(addprefix $(HOME)/., $(filter-out $(ignore), $(wildcard *)))

startup = $(wildcard startup/*)

WINDOWSHOME: links/WINDOWSHOME
links/WINDOWSHOME:
	ln -sf /mnt/c/Users/$(USER) $@


startup: $(addprefix links/, $(startup))

links/%: WINDOWSHOME
	ln -sf $(PWD)/$* $@

