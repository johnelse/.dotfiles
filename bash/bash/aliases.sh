# Remote control
alias a="spotify-cli play-album"
alias t="spotify-cli play-track"

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

# rdesktop
alias adserver='rdesktop 10.80.237.222 -a 16 -k en-gb -K -x 80 -d TEST -u Administrator'
alias adserver_small='adserver -g 1024x600'
alias adserver_med='adserver -g 1366x768'
alias adserver_large='adserver -g 1680x1050'

alias adserver_2k3='rdesktop 10.80.237.223 -K -g 1440x900'

# assorted shortcuts
alias api="~/Code/utils/xenapi-helpers/run"
alias erm='ssh ermintrude'
alias irc='irssi -c FreeNode'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias ls='ls -G --color=always'
alias ll='ls -l'
alias la='ls -a'
alias less='less -R'
alias gl='git log --graph --abbrev-commit --pretty=oneline --decorate'
# "open <filename>" uses the default application for <filename>
alias open='xdg-open'

alias todo='vim ~/Dropbox/todo/data/todo.txt'
