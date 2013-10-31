function grml() {
  find . -regex .*\\.mli? | xargs grep -Hn --color=always "$@"
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
function nvidia() {
  cd $ISSUES/NVIDIA-$@
}

function sctx() {
  cd $ISSUES/SCTX-$@
}

function xop() {
  cd $ISSUES/XOP-$@
}

function ca() {
  cd $ISSUES/bug-CA-$@
}

function code() {
  cd /usr/groups/sources/git/carbon/$@
}

function ctime() {
  python -c "import time; print time.ctime(${1})"
}

# Download and extract all the files for the given CA ticket.
function ca_ticket() {
  TICKET_NUMBER=$@
  cd $ISSUES
  bugget.py CA-$TICKET_NUMBER
  ca $TICKET_NUMBER
  # uz *.tar.gz
}

function md5each() {
  for ARG in $(ls)
  do
    md5sum $ARG >> checksums.md5
  done
}

# Mount windows shares.
function cifs_mount() {
  SHARE=$1
  MOUNTPOINT=$2
  # Unmount if anything is already mounted.
  mountpoint -q $MOUNTPOINT && sudo umount $MOUNTPOINT
  sudo mount.cifs $SHARE $MOUNTPOINT -o user=citrite\\johnel dom=citrite.net
}

function my_cifs_mount() {
  MOUNTPOINT=$1
  cifs_mount //lonpfs01/johnel$ $MOUNTPOINT
}

function lock_reason() {
  HOST=$1
  REASON=$2
  xenuse -r $HOST
  xenuse -l $HOST $REASON
}

function get_logs() {
  HOST=$1
  NEWDIR=logs-${HOST}
  mkdir $NEWDIR
  scp root@${HOST}:/var/log/* $NEWDIR
}
