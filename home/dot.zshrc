export EDITOR=nvim
export PATH="/opt/homebrew/bin:${HOME}/prod-bin:${HOME}/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"

# --
autoload -Uz compinit && compinit

# --
HISTSIZE=1000000
SAVEHIST=1000000
setopt INC_APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt histignoredups

# --
bindkey -e
setopt notify

# --
alias ls="ls -A"
alias ll="ls -lA"
alias vi="nvim"
if ! which ipython > /dev/null
then
	alias ipython="python3 -m IPython"
fi
alias gcpx="git cherry-pick -x"
alias grbiaa="git rebase -i --autostash --autosquash"
alias op-git-submodule-update="git submodule update --init --recursive"
alias meld="echo 'Use opendiff instead of meld!'; opendiff"

function ws_select() {
	local _regex="$1"
	local _wdir="${HOME}/data/git"
	local _dirs
	local _selected
	local _cache="${HOME}/.cache/ws_select-$(echo "${_regex}" | md5).cache"

	if [ -f ${_cache} ]
	then
		_dirs=$(cat ${_cache})
	else
		_dirs=$(find ${_wdir} -path "*/${_regex}/.git" -a \( -type d -o -type s \) -print)
		echo ${_dirs} > ${_cache}
	fi

	if [ -n "${_dirs}" ]
	then
		_dirs=$(dirname $(echo ${_dirs}))
		exec 3>&1;
		_selected=$(dialog --no-items --menu "WS Select" 20 200 80 $(echo ${_dirs}) 2>&1 1>&3)
		exec 3>&-;
	else
		echo "Item ${_regex} not found in ${_wdir}"
		return 1
	fi

	echo "Workspace ${_regex} found in ${_selected}"
	cd ${_selected}
}
