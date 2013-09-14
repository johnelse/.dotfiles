# Terminal
export TERM=xterm-color

# Locations
export LOC=/local/johnel-files
export ISSUES=$LOC/issues
export CARBON1=$LOC/hg/carbon
export CARBON2=/local/spare/hg/carbon

export GEORGE_LCM=$CARBON2/george-lcm/build.hg
export MNR_LCM=$CARBON2/mnr-lcm/build.hg
export COWLEY_LCM=$CARBON1/cowley-lcm/build.hg
export OXFORD_LCM=$CARBON1/oxford-lcm/build.hg
export BOSTON_LCM=$CARBON2/boston-lcm/build.hg
export SANIBEL_LCM=$CARBON2/sanibel-lcm/build.hg
export TAMPA_LCM=$CARBON2/tampa-lcm/build.hg
export CLEARWATER_LCM=$CARBON2/clearwater-lcm/build.hg

export RING3=$CARBON2/trunk-ring3/build.hg
export RING3_CHROOT=$RING3/obj/chroot-dom0-env
export RING3_API=$RING3/myrepos/xen-api
export RING3_CODE=$RING3_API/ocaml

export PR_1061=$CARBON2/pr-1061/build.hg

export PERF=$CARBON2/trunk-perf/build.hg

# Editors
export EDITOR=/usr/bin/vim
export SVN_EDITOR=/usr/bin/vim

# Make RokClock work better with xmonad.
export _JAVA_AWT_WM_NONREPARENTING=1

# Building XenServer
export CLEAN_AFTER_BUILD=no
