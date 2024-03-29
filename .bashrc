[[ $- != *i* ]] && return
export VISUAL="vim"
export EDITOR="vim"
#alias ls='ls -la --color=auto'
alias ls='exa -la'
alias vim='nvim'
alias grep='grep --color=auto'
alias icat="kitty +kitten icat"
alias gd="git difftool --no-symlinks --dir-diff"

alias kubectl="kubecolor"
alias kcl="kubectl config get-clusters"
alias kcu="kubectl config use-context"
alias kcc="kubectl config current-context"
alias kgn="kubectl get node"
alias gb="git branch -a | fzf-tmux -p 80%,60% | xargs -r git checkout"
alias ed="fzf-tmux -p 80%,60% | xargs -r nvim"

export JAVA_HOME=/opt/jdk/jdk-11.0.11/
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

source <(kitty + complete setup bash)
source <(kubectl completion bash)
complete -C '/usr/bin/aws_completer' aws

# get current branch in git repo
function parse_git_branch() {
BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
if [ ! "${BRANCH}" == "" ]
then
 STAT=`parse_git_dirty`
 echo "[${BRANCH}${STAT}]"
else
 echo ""
fi
}

# get current status of git repo
function parse_git_dirty {
status=`git status 2>&1 | tee`
dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
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


# export PS1="\[\e[33m\]\u\[\e[m\]@\[\e[32m\]\h\[\e[m\][\[\e[34m\]\W\[\e[m\]]\[\e[36m\]\`parse_git_branch\`\[\e[m\]\\$ "
export PS1='\[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(parse_git_branch " (%s)")\[\e[0;39m\] \[\e[1;37m\]$ '
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# BEGIN_KITTY_SHELL_INTEGRATION
# if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
fi

complete -C /home/marius/workspace/tools/terraform/terraform-bin terraform
