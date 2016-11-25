# Set the shell variable for tmux
export SHELL=/usr/local/bin/zsh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

source ~/.zplug/zplug

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# zplug "b4b4r07/enhancd", of:enhancd.sh

# Enable cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

fpath+=${HOME}/.zfunc

# Eompinit
autoload -Uz compinit
compinit

zplug "mollifier/anyframe"
zstyle ":anyframe:selector:" use peco

# input
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-cdr

bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history

bindkey '^xp' anyframe-widget-put-history
bindkey '^x^p' anyframe-widget-put-history

bindkey '^xg' anyframe-widget-cd-ghq-repository
bindkey '^x^g' anyframe-widget-cd-ghq-repository

bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill

bindkey '^xi' anyframe-widget-insert-git-branch
bindkey '^x^i' anyframe-widget-insert-git-branch

bindkey '^xf' anyframe-widget-insert-filename
bindkey '^x^f' anyframe-widget-insert-filename


zplug "junegunn/dotfiles", as:command, of:bin/vimcat
zplug "tcnksm/docker-alias", of:zshrc, as:plugin
zplug "k4rthik/git-cal", as:command, frozen:1
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    file:fzf

zplug "plugins/git", from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/opt/bin

# Style
#============================================================================================
# ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

source ${HOME}/.zsh/custom/conf.zsh
