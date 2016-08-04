function grml() {
  find . -regex .*\\.mli? | xargs grep -Hn --color=always "$@"
}

function grj() {
  find . -name *.java | xargs grep -Hn --color=always "$@"
}

function grpp() {
  find . -name '*.cpp' -or -name '*.h' -or -name '*.hpp' -or -name '*.inl' \
    | xargs grep -Hn --color=always "$@"
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
