DOTCONFIG:
	stow -v -t ~/.config/ .config/

clean:
	stow -v -D -t ~/.config/ .config/

local: clean DOTCONFIG

.PHONY: DOTCONFIG local clean
