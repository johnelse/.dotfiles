function grml() {
  find . -regex .*\\.mli? -print0 | xargs -0 grep -Hn --color=always "$@"
}

function grj() {
  find . -name *.java -print0 | xargs -0 grep -Hn --color=always "$@"
}

function grpp() {
  find . \( -name '*.cpp' -or -name '*.h' -or -name '*.hpp' -or -name '*.inl' \) -print0 \
    | xargs -0 grep -Hn --color=always "$@"
}

function where() {
  grep -rlI "$@" .
}

# Misc. utils
function cdi() {
  mkdir $@
  cd $@
}

# Laziness.
function ctime() {
  python -c "import time; print time.ctime(${1})"
}

function md5each() {
  for ARG in $(ls)
  do
    md5sum $ARG >> checksums.md5
  done
}

# Useful when tmux isn't in a common $PATH
function sshtmux() {
    ssh $1 -t 'exec bash -l -c "tmux attach"'
}

# inMusic stuff
function mergeto {
  git push jelse -o merge_request.create -o merge_request.target=$1
}

function acvs() {
  cd ~/issues/ACVS-${1}
}

function tidy_docker() {
    docker ps -a | grep "Exited " | awk '{print $1}' | xargs docker rm
    docker images | grep "\<none\>" | awk '{print $3}' | xargs docker rmi
}
