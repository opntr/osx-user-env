all:
	@echo "try make install"

install:
	install -d -m 0750 $(HOME)/.config/nvim
	install -d -m 0750 $(HOME)/.config/nvim/plugged
	install -d -m 0750 $(HOME)/.local/share/nvim/site/autoload
	install -m 0440 init.vim	$(HOME)/.config/nvim
	install -m 0440 plug.vim	$(HOME)/.local/share/nvim/site/autoload

bootstrap:
	brew install python3
	brew install neovim
	pip3 install neovim --upgrade
