
startup = $(wildcard startup/*)

startup: $(addprefix links/, $(startup))

WINDOWSHOME: links/WINDOWSHOME
links/WINDOWSHOME:
	ln -sf /mnt/c/Users/$(USER) $@

links/%: WINDOWSHOME
	@#ln -sf $(PWD)/$* $@
	cp $* $@

