export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -z "${PS1}" ]
then
	return
fi

export PS1="\u@\h:\w\\$ \[$(tput sgr0)\]"

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth

alias ls='ls -A'
alias ll='ls -Al'
alias pkg='brew'
alias gcp='git cherry-pick'
alias gcpx='git cherry-pick -x'
if which -s nvim
then
	alias vi='nvim'
fi

PATH=${PATH}:${HOME}/bin
export PATH

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
