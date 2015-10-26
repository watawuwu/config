# User configuration
#============================================================================================

# You may need to manually set your language environment
export LANG=ja_JP.UTF-8
export LC_ALL=$LANG
export LC_CTYPE=$LANG

# Load aliasses
if [ -f ~/.shell_aliases ]; then
    . ~/.shell_aliases
fi

# History
HIST_STAMPS="mm/dd/yyyy"
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Unlimited flow control
stty -ixon


# Set Environment
#--------------------------------------------------------------------------------------------
# Python
export PYTHONPATH=/usr/local/lib/python2.7/site-packages/

# Emacs
export SVN_EDITOR='/usr/local/bin/emacsclient'
export EDITOR='/usr/local/bin/emacsclient'
export VISUAL='/usr/local/bin/emacsclient'

# android
export ANDROID_HOME=${HOME}/opt/adt-bundle/sdk
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${ANDROID_HOME}/tools


# scala
export SCALA_HOME="/opt/scala"

# sbt
export SBT_HOME="/opt/sbt"

# nodebrew
export NODEBREW_ROOT=$HOME/.nodebrew

# Nim
export NIM_HOME=${HOME}"/repo/Nim"
export NIMBLE_HOME=${HOME}"/.nimble"

# Brewfile
export HOMEBREW_BREWFILE=${HOME}/Dropbox/config/brew-file/Brewfile
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# My bin directory
export PATH=$PATH:$HOME/opt/bin


# functions
#--------------------------------------------------------------------------------------------

# utc utils
utc2date() {
  date --date "@${1}" +"%Y-%m-%d %H:%M:%S"
  date -u --date "@${1}" +"%Y-%m-%d %H:%M:%S UTC"
}

date2utc() {
  date -j "%Y/%m/%d %H:%M:%S" "$1" +%s
}



# Middleware
#============================================================================================

# Ruby
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

# jenv
if [[ -n `which jenv` ]]
then
  eval "$(jenv init - zsh)"
fi

# Brewfile
if [[ -f $(brew --prefix)/etc/brew-wrap ]]
then
  source $(brew --prefix)/etc/brew-wrap
fi

# Java
if [[ `uname` = "Darwin" ]]
then
  # for osx
  export JAVA_HOME=`/usr/libexec/java_home`
  export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
elif [[ `uname` = "Linux" ]]
then
  # for ubuntu
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle/
fi


# Override setting
#============================================================================================
if [[ -f ${HOME}/.zsh_local ]]
then
  source ${HOME}/.zsh_local
fi

