# for tmux
export SHELL=/usr/local/bin/zsh

# override setting
if [ -f ~/.zsh_local ]; then
  source ~/.zsh_local
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
#ZSH_THEME="powerline"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=${HOME}/.zsh/custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git scala sbt python aws brew history tmux colored-man docker vagrant tig encode64 my-env)

# User configuration

export PATH="${HOME}/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:${HOME}/.rbenv/shims:${HOME}/opt/adt-bundle/sdk/platform-tools:${HOME}/opt/adt-bundle/sdk/tools:${HOME}/opt/bin:/opt/scala/bin:/opt/sbt/bin:${HOME}/opt/play:${HOME}/opt/activator:${HOME}/opt/gradle/bin:${HOME}/opt/SimpleNotificationServiceCli/bin:${HOME}/.nodebrew/current/bin:${HOME}/repo/Nim/bin:${HOME}/.nimble/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment

export LANG=ja_JP.UTF-8
export LC_ALL=$LANG
export LC_CTYPE=$LANG

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# enable cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# compinit
autoload -Uz compinit
compinit


if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi


#HIST_STAMPS="yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000


# unlimited flow control
stty -ixon

# python
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/

# emacs
export SVN_EDITOR='/usr/local/bin/emacsclient'
export EDITOR='/usr/local/bin/emacsclient'
export VISUAL='/usr/local/bin/emacsclient'


# ruby
if [[ -n `which rbenv` ]]
then
  eval "$(rbenv init - zsh)"
fi

# phpenv
if [[ -n `which phpenv` ]]
then
  export PATH=${HOME}/.phpenv/bin:$PATH
  eval "$(phpenv init - zsh )"
fi

# java
if [[ -n `which jenv` ]]
then
  eval "$(jenv init - zsh)"
fi


# android

export ANDROID_HOME=${HOME}/opt/adt-bundle/sdk
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/tools


# my opt
export PATH=$PATH:$HOME/opt/bin

# scala
export SCALA_HOME="/opt/scala"
export PATH=$PATH:$SCALA_HOME/bin

# sbt
export SBT_HOME="/opt/sbt"
export PATH=$PATH:$SBT_HOME/bin

# play
export PLAY_HOME=${HOME}"/opt/play"
export PATH=$PATH:$PLAY_HOME

# pvtivator
export ACTIVATOR_HOME=${HOME}"/opt/activator"
export PATH=$PATH:$ACTIVATOR_HOME

# gradle
export GRADLE_HOME=${HOME}"/opt/gradle"
export PATH=$PATH:$GRADLE_HOME/bin

# sns-cli
export AWS_SNS_HOME=${HOME}"/opt/SimpleNotificationServiceCli"
export PATH=$PATH:$AWS_SNS_HOME/bin

# nodebrew
export NODEBREW_ROOT=$HOME/.nodebrew
export PATH=$PATH:${HOME}/.nodebrew/current/bin

# Nim
export NIM_HOME=${HOME}"/repo/Nim"
export NIMBLE_HOME=${HOME}"/.nimble"
export PATH=$PATH:$NIM_HOME/bin:$NIMBLE_HOME/bin

# Brewfile
export HOMEBREW_BREWFILE=${HOME}/Dropbox/config/brew-file/Brewfile
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

if [ `uname` = "Darwin" ]; then
  # for osx
  export JAVA_HOME=`/usr/libexec/java_home`

  # package config
  export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

elif [ `uname` = "Linux" ]; then
  # for ubuntu
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle/

fi


# functions
#============================================================================================

# utc utils
function utc2date() {
  date --date "@${1}" +"%Y-%m-%d %H:%M:%S"
  date -u --date "@${1}" +"%Y-%m-%d %H:%M:%S UTC"
}

function date2utc() {
  date -j "%Y/%m/%d %H:%M:%S" "$1" +%s
}

# http://qiita.com/mollifier/items/81b18c012d7841ab33c3
if [ -d $HOME/.zsh/anyframe ]
then
  fpath=($HOME/.zsh/anyframe(N-/) $fpath)
  autoload -Uz anyframe-init
  anyframe-init
  zstyle ":anyframe:selector:" use peco

  # input

  bindkey '^xb' anyframe-widget-cdr
  bindkey '^x^b' anyframe-widget-checkout-git-branch

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

fi


# feel look
#============================================================================================
CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    ZSH_THEME_GIT_PROMPT_DIRTY='±'
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi
    echo -n "${ref/refs\/heads\//⭠ }$dirty"
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment blue black '%~'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment black default "$symbols"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '
