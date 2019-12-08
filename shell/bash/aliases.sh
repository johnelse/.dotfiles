# Remote control
alias a="spotify-cli play-album"
alias t="spotify-cli play-track"

# Hacks
# xfce+xmonad doesn't start up properly...this seems to fix things.
alias fixxmonad="xfce4-panel --restart"

# Filesystem
alias u='cd ..'
alias uj='tar jxvf'
# equivalent command uz is provided by Debian for gzip'd tarballs.

# Searching
alias fn='find . -name'
alias na='grep -v autogen'

# ocaml
####################################################################################
#
# see: http://tech.groups.yahoo.com/group/ocaml_beginners/message/2929
#
# if you want a toplevel using thread :
#   ocamlmktop -thread threads.cma -o ocamlthread
#
# You need then to launch it with :
#
#   ./ocamlthread -I +threads
#
# beware that if your ocaml is compiled with POSIX thread, you will need
# to add unix.cma before threads.cma.
#
####################################################################################
alias ocamlthread='rlwrap -cr ocamlthread -I +threads'

# assorted shortcuts
alias api="~/Code/utils/xenapi-helpers/run"
alias irc='irssi -c FreeNode'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# OS-specific
case $(uname -s) in
    Darwin)
        alias ls='ls -G'
        ;;
    Linux)
        alias ls='ls --color=always'
        # "open <filename>" uses the default application for <filename>
        alias open='xdg-open'
        ;;
    *)
        ;;
esac

alias ll='ls -l'
alias la='ls -a'
alias less='less -R'
alias gl='git log --graph --abbrev-commit --pretty=oneline --decorate'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias todo='vim ~/Sync/mobile/todo/data/todo.txt'
