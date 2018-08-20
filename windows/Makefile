
startup = $(wildcard startup/*)

startup: $(addprefix links/, $(startup))

WINDOWSHOME: links/WINDOWSHOME
links/WINDOWSHOME:
	ln -sf /mnt/c/Users/$(USER) $@

links/%: WINDOWSHOME
	@#ln -sf $(PWD)/$* $@
	cp $* $@

powerline: powerline-shell fonts
fonts: src/fonts
	cd src/fonts && sudo ./install.ps1
powerline-shell: src/powerline-shell
	cd src/powerline-shell && sudo python ./setup.py install
src/fonts:
	git clone https://github.com/powerline/fonts.git src/fonts
src/powerline-shell:
	git clone https://github.com/banga/powerline-shell.git src/powerline-shell

