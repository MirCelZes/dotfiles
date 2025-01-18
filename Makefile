DOTCONFIG:
	stow -v -t ~/.config/ .config/

local: DOTCONFIG

.PHONY: DOTCONFIG local
