#  _               _
# | |__   __ _ ___| |__  _ __ ___
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__
# |_.__/ \__,_|___/_| |_|_|  \___|
#

[[ $- != *i* ]] && return
shopt -s autocd
HISTSIZE=''
HISTFILESIZE=''

export VISUAL="nvim"
export EDITOR="nvim"

alias ls='exa -lha --group-directories-first'
alias vim='nvim'
alias grep='grep --color=auto'
alias icat="kitty +kitten icat"
alias gd="git difftool --no-symlinks --dir-diff"

alias dushx="du -shx -- * | sort -rh | head -n 10"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias tree="tree -C -L3"

alias kubectl="kubecolor"
alias kcl="kubectl config get-clusters"
alias kcc="kubectl config current-context"
alias kgn="kubectl get node"
alias gb="git branch -a | fzf-tmux -p 80%,60% | xargs -r git checkout"
alias ed="fzf-tmux -p 80%,60% | xargs -r nvim"
alias gs="git status"

export KUBECOLOR_PRESET=pre-0.0.21-dark

source <(kubectl completion bash)
complete -C '/usr/bin/aws_completer' aws
source /usr/share/fzf/key-bindings.bash

# get current branch in git repo
function parse_git_branch() {
	BRANCH=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	if [ ! "${BRANCH}" == "" ]; then
		STAT=$(parse_git_dirty)
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=$(git status 2>&1 | tee)
	dirty=$(
		echo -n "${status}" 2>/dev/null | grep "modified:" &>/dev/null
		echo "$?"
	)
	untracked=$(
		echo -n "${status}" 2>/dev/null | grep "Untracked files" &>/dev/null
		echo "$?"
	)
	ahead=$(
		echo -n "${status}" 2>/dev/null | grep "Your branch is ahead of" &>/dev/null
		echo "$?"
	)
	newfile=$(
		echo -n "${status}" 2>/dev/null | grep "new file:" &>/dev/null
		echo "$?"
	)
	renamed=$(
		echo -n "${status}" 2>/dev/null | grep "renamed:" &>/dev/null
		echo "$?"
	)
	deleted=$(
		echo -n "${status}" 2>/dev/null | grep "deleted:" &>/dev/null
		echo "$?"
	)
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

kcu() {
	if [ -z "$1" ]; then
		echo "no k8s context supplied!"
		return
	fi

	x=$(kubectl config get-clusters | grep -E "$1")

	if [ -z "$x" ]; then
		echo "no k8s context found!"
		return
	fi

	contexts=$(echo "${x}" | cut -d " " -f1 | wc -l)
	if [ "$contexts" != "1" ]; then
		echo "multiple (${contexts}) contexts found, be more specific!"
		return
	fi

	(kubectl config use-context "${x}")

	cc=$([ "$1" == "df-pro-2" ] && echo "(df-pro-2)" || echo "")
	export PS1='${cc}\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(parse_git_branch " (%s)")\[\e[0;39m\] \[\e[1;37m\]$ '
}

export PS1='\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(parse_git_branch " (%s)")\[\e[0;39m\] \[\e[1;37m\]$ '
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export LESS="--RAW-CONTROL-CHARS"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

complete -C /home/marius/workspace/go_wrk/src/github.com/terraform/terraform-bin terraform

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
