# Terminal
export TERM=xterm-color

# Locations
export LOC=/local/johnel-files
export ISSUES=$LOC/issues
export CARBON=/local/spare/hg/carbon

export BOSTON_LCM=$CARBON/boston-lcm/build.hg
export SANIBEL_LCM=$CARBON/sanibel-lcm/build.hg
export TAMPA_LCM=$CARBON/tampa-lcm/build.hg
export CLEARWATER_LCM=$CARBON/clearwater-lcm/build.hg

export RING3=$CARBON/trunk-ring3/build.hg
export RING3_CHROOT=$RING3/obj/chroot-dom0-env
export RING3_API=$RING3/myrepos/xen-api
export RING3_CODE=$RING3_API/ocaml

export EA_1268=$CARBON/trunk-ring3-ea1268/build.hg
export PR_1061=$CARBON/pr-1061/build.hg
export PR_1675=$CARBON/pr-1675/build.hg

export PERF=$CARBON/trunk-perf/build.hg

# Editors
export EDITOR=/usr/bin/vim
export SVN_EDITOR=/usr/bin/vim

# Make RokClock work better with xmonad.
export _JAVA_AWT_WM_NONREPARENTING=1

# Building XenServer
export CLEAN_AFTER_BUILD=no

# Prompt
# http://lukasrieder.com/2009/07/14/extend-your-bash-ps1.html
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
PS1="\[\e[0;32;49m\]\u@\h:\W\[\e[0;33;49m\]\$(parse_git_branch)\[\e[0;31;49m\]$\[\e[0;0m\] "

# Path
PATH=$PATH:/usr/groups/xencore/systems/bin
PATH=$PATH:/usr/groups/xenrt/production/share/control
PATH=$PATH:~/Scripts/johnel
PATH=$PATH:$CARBON/trunk-ring3/support.hg/bugget
PATH=$PATH:$LOC/bin
PATH=$PATH:~/bin
PATH=$PATH:/usr/local/installed/opam/bin
