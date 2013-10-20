# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
if [ -x /usr/local/bin/gdircolors ]; then
    test -r ~/.dircolors && eval "$(/usr/local/bin/gdircolors -b ~/.dircolors)" || eval "$(/usr/local/bin/gdircolors -b)"
    #alias ls='gls -G'
    alias ls='gls --color'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# emacs
alias ec="/usr/local/bin/emacsclient"
alias ecn="/usr/local/bin/emacsclient -nw"
alias now=`echo date +'%Y%m%d%H%M%S'`

# ctags
alias ctags="/usr/local/bin/ctags"

# diff
alias cdiff="colordiff --side-by-side"

if [ `uname` = "Darwin" ]; then
    # for osx
    #============================================================================================

    # some more ls aliases
    #export LS_COLORS="no=00;31:fi=00;37:di=00;36:ln=00;31:ex=00;31"
    alias ll='gls -alF --color'
    alias la='gls -A --color'
    alias l='gls -CF --color'

    # quick look from terminal
    alias q="qlmanage -t"

    # emacs
    alias emacs="open -a /Applications/Emacs.app"

    # clipbord
    alias c='pbcopy'

    # locate
    alias updatedb="sudo /usr/libexec/locate.updatedb"

    alias find=gfind
    alias xargs=gxargs
    alias strings=gstrings

    # for com in `ls $(brew --prefix coreutils)/libexec/gnubin `;do echo alias $com=g$com;done >> .bashex
    alias base64=gbase64
    alias basename=gbasename
    alias cat=gcat
    alias chcon=gchcon
    alias chgrp=gchgrp
    alias chmod=gchmod
    alias chown=gchown
    alias chroot=gchroot
    alias cksum=gcksum
    alias comm=gcomm
    alias cp=gcp
    alias csplit=gcsplit
    alias cut=gcut
    alias date=gdate
    alias dd=gdd
    alias df=gdf
    alias dir=gdir
    alias dircolors=gdircolors
    alias dirname=gdirname
    alias du=gdu
    alias echo=gecho
    alias env=genv
    alias expand=gexpand
    alias expr=gexpr
    alias factor=gfactor
    alias false=gfalse
    alias fmt=gfmt
    alias fold=gfold
    alias groups=ggroups
    alias head=ghead
    alias hostid=ghostid
    alias id=gid
    alias install=ginstall
    alias join=gjoin
    alias kill=gkill
    alias link=glink
    alias ln=gln
    alias logname=glogname
    alias ls=gls
    alias md5sum=gmd5sum
    alias mkdir=gmkdir
    alias mkfifo=gmkfifo
    alias mknod=gmknod
    alias mktemp=gmktemp
    alias mv=gmv
    alias nice=gnice
    alias nl=gnl
    alias nohup=gnohup
    alias nproc=gnproc
    alias od=god
    alias paste=gpaste
    alias pathchk=gpathchk
    alias pinky=gpinky
    alias pr=gpr
    # bash-completion is error
    #alias printenv=gprintenv
    #alias printf=gprintf
    alias ptx=gptx
    alias pwd=gpwd
    alias readlink=greadlink
    alias realpath=grealpath
    alias rm=grm
    alias rmdir=grmdir
    alias runcon=gruncon
    alias seq=gseq
    alias sha1sum=gsha1sum
    alias sha224sum=gsha224sum
    alias sha256sum=gsha256sum
    alias sha384sum=gsha384sum
    alias sha512sum=gsha512sum
    alias shred=gshred
    alias shuf=gshuf
    alias sleep=gsleep
    alias sort=gsort
    alias split=gsplit
    alias stat=gstat
    alias stty=gstty
    alias sum=gsum
    alias sync=gsync
    alias tac=gtac
    alias tail=gtail
    alias tee=gtee
    alias test=gtest
    alias timeout=gtimeout
    alias touch=gtouch
    alias tr=gtr
    alias true=gtrue
    alias truncate=gtruncate
    alias tsort=gtsort
    alias tty=gtty
    alias uname=guname
    alias unexpand=gunexpand
    alias uniq=guniq
    alias unlink=gunlink
    alias uptime=guptime
    alias users=gusers
    alias vdir=gvdir
    alias wc=gwc
    alias who=gwho
    alias whoami=gwhoami
    alias yes=gyes

    # git
    alias git=/usr/local/bin/git

    # tmux
    alias tm='/usr/local/bin/tmuxx'

elif [ `uname` = "Linux" ]; then
    # for ubuntu
    #============================================================================================

    # clipbord
    alias c="xsel --input --clipboard"

    # emacs
    alias emacs="TERM=xterm-256color XMODIFIERS=@im=none emacs"

    # some more ls aliases
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi