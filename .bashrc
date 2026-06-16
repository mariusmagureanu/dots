
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/bashrc.pre.bash" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/bashrc.pre.bash"

##  _               _
## | |__   __ _ ___| |__  _ __ ___
## | '_ \ / _` / __| '_ \| '__/ __|
## | |_) | (_| \__ \ | | | | | (__
## |_.__/ \__,_|___/_| |_|_|  \___|
##

[[ $- != *i* ]] && return
shopt -s autocd
HISTSIZE=''
HISTFILESIZE=''

export VISUAL="nvim"
export EDITOR="nvim"

alias ls='eza -lha --group-directories-first --icons=always'
alias vim='nvim'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias tree='tree -C -L3'
alias icat='kitty +kitten icat'
alias gd='git difftool --no-symlinks --dir-diff'
alias dushx='du -shx -- * | sort -rh | head -n 10'

alias kubectl='kubecolor'
alias kcl='kubectl config get-clusters'
alias kcc='kubectl config current-context'
alias kgn='kubectl get node'
alias gb='git branch -a | fzf-tmux -p 80%,60% | xargs -r git checkout'
alias ed='fzf-tmux -p 80%,60% | xargs -r nvim'
alias gs='git status'

export KUBECOLOR_PRESET=pre-0.0.21-dark

source <(kubectl completion bash)
complete -C '/usr/bin/aws_completer' aws
source /usr/share/fzf/key-bindings.bash

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

  kubectl config use-context "${x}"
}

eval "$(starship init bash)"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

export LESS="--RAW-CONTROL-CHARS"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

complete -C /home/marius/workspace/go_wrk/src/github.com/terraform/terraform-bin terraform

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"

pods() {
  command='kubectl get pods -A' fzf \
    --info=inline --layout=reverse --header-lines=1 \
    --prompt "$(kubectl config current-context | sed 's/-context$//')> " \
    --header $'╱ Enter (kubectl exec) ╱ CTRL-O (open log in editor) ╱ CTRL-R (reload) ╱\n\n' \
    --bind 'start,ctrl-r:reload:$command' \
    --bind 'ctrl-/:change-preview-window(80%,border-bottom|hidden|)' \
    --bind 'enter:execute:kubectl exec -it --namespace {1} {2} -- bash' \
    --bind 'ctrl-o:execute:${EDITOR:-vim} <(kubectl logs --all-containers --namespace {1} {2})' \
    --preview-window up:follow \
    --preview 'kubectl logs --follow --all-containers --tail=10000 --namespace {1} {2}' "$@"
}

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/.local/share/kiro-cli/shell/bashrc.post.bash" ]] && builtin source "${HOME}/.local/share/kiro-cli/shell/bashrc.post.bash"
