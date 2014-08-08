# Prompt
# http://lukasrieder.com/2009/07/14/extend-your-bash-ps1.html
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
PS1="\[\e[0;32;49m\]\u@\h:\W\[\e[0;33;49m\]\$(parse_git_branch)\[\e[0;31;49m\]$\[\e[0;0m\] "
