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

# Mount windows shares.
# CIFS path needs to be single quoted, e.g.
# cifs_mount '\\host.citrite.net\foo\bar\' /mnt
function cifs_mount() {
  SHARE=$(echo $1 | sed -e 's/\\/\//g')
  MOUNTPOINT=$2
  # Unmount if anything is already mounted.
  mountpoint -q $MOUNTPOINT && sudo umount $MOUNTPOINT
  sudo mount.cifs $SHARE $MOUNTPOINT -o user=johnel dom=citrite.net
}

function my_cifs_mount() {
  MOUNTPOINT=$1
  cifs_mount //lonpfs01/johnel$ $MOUNTPOINT
}

function to_vm() {
  FILE=$1
  scp $FILE john@192.168.56.101:/tmp
}

# Useful when tmux isn't in a common $PATH
function sshtmux() {
    ssh $1 -t 'exec bash -l -c "tmux attach"'
}
