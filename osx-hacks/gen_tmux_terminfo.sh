#!/usr/bin/env bash

set -x

# see https://github.com/tmux/tmux/issues/1257#issuecomment-581378716

if ! brew list | grep ncurses
then
	brew install ncurses
fi

infocmp=$(brew list ncurses | grep bin/infocmp)

${infocmp} tmux-256color > ~/.tmux-256color.info

# This creates a complied entry in ~/.terminfo
tic -xe tmux-256color ~/.tmux-256color.info

# Verify the addition of tmux-256color
infocmp tmux-256color | head
