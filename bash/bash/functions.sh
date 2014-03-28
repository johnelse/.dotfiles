function grml() {
  find . -regex .*\\.mli? | xargs grep -Hn --color=always "$@"
}

function grj() {
  find . -name *.java | xargs grep -Hn --color=always "$@"
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
function ca() {
  cd $ISSUES/bug-CA-$@
}

function nvidia() {
  cd $ISSUES/bug-NVIDIA-$@
}

function sctx() {
  cd $ISSUES/bug-SCTX-$@
}

function xop() {
  cd $ISSUES/bug-XOP-$@
}

# Download all files for the given ticket.
function get_ticket() {
  TICKET_TYPE=$1
  TICKET_NUMBER=$2
  cd $ISSUES
  bugget.py ${TICKET_TYPE}-${TICKET_NUMBER}
  ${TICKET_TYPE,,} ${TICKET_NUMBER}
}

function ca_ticket() {
  get_ticket CA $1
}

function nvidia_ticket() {
  get_ticket NVIDIA $1
}

function sctx_ticket() {
  get_ticket SCTX $1
}

function xop_ticket() {
  get_ticket XOP $1
}

function code() {
  cd /usr/groups/sources/git/carbon/$@
}

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
function cifs_mount() {
  SHARE=$1
  MOUNTPOINT=$2
  # Unmount if anything is already mounted.
  mountpoint -q $MOUNTPOINT && sudo umount $MOUNTPOINT
  sudo mount.cifs $SHARE $MOUNTPOINT -o user=johnel dom=citrite.net
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

function update_xapi_on() {
  if [ $(basename $(pwd)) != "build.hg" ]
  then
    echo "Error: not in build.hg"
    return 1
  else
    HOST=$1
    XAPI_RPM=`find output/api/RPMS/i686 -name xapi-core-*`
    scp $XAPI_RPM root@${HOST}:
    ssh root@${HOST} "rpm -U $(basename ${XAPI_RPM}) --force"
    ssh root@${HOST} "service xapi restart"
  fi
}
