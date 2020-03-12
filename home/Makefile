all:
	@echo "try make install"

install:
	install -d -m 0750 $(HOME)/bin
	install -d -m 0750 $(HOME)/.git
	install -m 0440 dot.vimrc.clang_complete		$(HOME)/.vimrc
	install -m 0440 dot.screenrc		$(HOME)/.screenrc
	install -m 0440 dot.tmux.conf		$(HOME)/.tmux.conf
	install -m 0440 dot.bash_profile	$(HOME)/.bash_profile
	install -m 0440 dot.bashrc		$(HOME)/.bashrc
	install -m 0440 dot.gitconfig		$(HOME)/.gitconfig
	install -m 0440 dot.git/commit-template	$(HOME)/.git/commit-template
	install -m 0440 dot.git/opbsd-template	$(HOME)/.git/opbsd-template
	make -C nvim/Makefile install

contribinstall:
	install -m 0550 contrib/dot.git-completion.bash		$(HOME)/.git-completion.bash
	install -m 0550 contrib/dot.git-completion.tcsh		$(HOME)/.git-completion.tcsh
