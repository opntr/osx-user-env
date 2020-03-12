export LC_COLLATE=C
export LC_NUMERIC=C
export LC_TIME=C
export LC_MESSAGES=C
export LC_MONETARY=en_US

if which -s nvim
then
	export EDITOR=nvim
else
	export EDITOR=vim
fi

if [ -f ~/.bashrc ]
then
	source ~/.bashrc
fi
