#!/bin/bash

# We want to ensure these directories exist
DIRS=(
    "$HOME/bin"
    "$HOME/Code/gopath"
)

# Config files within the repository
FILE_PATHS=(
    "$HOME/.dotfiles/shell/profile"
    "$HOME/.dotfiles/shell/bashrc"
    "$HOME/.dotfiles/shell/bash"
    "$HOME/.dotfiles/git/gitconfig"
    "$HOME/.dotfiles/git/gitignore_global"
    "$HOME/.dotfiles/hg/hgrc"
    "$HOME/.dotfiles/hg/hgignore"
    "$HOME/.dotfiles/irb/irbrc"
    "$HOME/.dotfiles/irssi"
    "$HOME/.dotfiles/screen/screenrc"
    "$HOME/.dotfiles/scripts/backup-watson"
    "$HOME/.dotfiles/scripts/create-html-index"
    "$HOME/.dotfiles/scripts/docker-jekyll-serve"
    "$HOME/.dotfiles/scripts/ntfy"
    "$HOME/.dotfiles/scripts/new-file-cpp"
    "$HOME/.dotfiles/scripts/new-file-h"
    "$HOME/.dotfiles/scripts/new-program-cpp"
    "$HOME/.dotfiles/scripts/new-script-bash"
    "$HOME/.dotfiles/scripts/new-script-python"
    "$HOME/.dotfiles/scripts/spotify-cli-wrapper"
    "$HOME/.dotfiles/tmux/tmux.conf"
    "$HOME/.dotfiles/tmux/tmux-start"
    "$HOME/.dotfiles/vim/vimrc"
    "$HOME/.dotfiles/vim/vim"
)

# Paths at which we want to create symlinks to the config files
LINK_PATHS=(
    "$HOME/.profile"
    "$HOME/.bashrc"
    "$HOME/.bash"
    "$HOME/.gitconfig"
    "$HOME/.gitignore_global"
    "$HOME/.hgrc"
    "$HOME/.hgignore"
    "$HOME/.irbrc"
    "$HOME/.irssi"
    "$HOME/.screenrc"
    "$HOME/bin/backup-watson"
    "$HOME/bin/create-html-index"
    "$HOME/bin/docker-jekyll-serve"
    "$HOME/bin/ntfy"
    "$HOME/bin/new-file-cpp"
    "$HOME/bin/new-file-h"
    "$HOME/bin/new-program-cpp"
    "$HOME/bin/new-script-bash"
    "$HOME/bin/new-script-python"
    "$HOME/bin/spotify-cli-wrapper"
    "$HOME/.tmux.conf"
    "$HOME/bin/tmux-start"
    "$HOME/.vimrc"
    "$HOME/.vim"
)

case `uname -s` in
    Linux)
        DIRS+=("$HOME/.xmonad")
        FILE_PATHS+=("$HOME/.dotfiles/xmonad/xmonad.hs")
        LINK_PATHS+=("$HOME/.xmonad/xmonad.hs")

        DIRS+=("$HOME/.config")
        FILE_PATHS+=("$HOME/Sync/default/backup/watson/live")
        LINK_PATHS+=("$HOME/.config/watson")

        DIRS+="$HOME/Desktop"
        FILE_PATHS+=("$HOME/.dotfiles/scripts/start-xmonad")
        LINK_PATHS+=("$HOME/Desktop/start-xmonad")

        DIRS+="$HOME/bin"
        FILE_PATHS+=("$HOME/.dotfiles/scripts/switch-headphones")
        LINK_PATHS+=("$HOME/bin/switch-headphones")
        ;;
    Darwin)
        DIRS+=("$HOME/Library/Application Support/")
        FILE_PATHS+=("$HOME/Sync/default/backup/watson/live")
        LINK_PATHS+=("$HOME/Library/Application Support/watson")
        ;;
    *)
        ;;
esac

function create_dir() {
    DIR_PATH=$1

    # Create directory if it doesn't exist,
    # or fail if it exists and is not a directory.
    if [ -e "$DIR_PATH" ]; then
        if [ ! -d "$DIR_PATH" ]; then
            echo "${DIR_PATH} exists and is not a directory!"
            exit 1
        fi
    else
        mkdir -pv $DIR_PATH
    fi
}

function create_link() {
    FILE_PATH=$1
    LINK_PATH=$2

    # Remove other files (-h => only if they're symlinks already => a bit safer)
    [ -h "$LINK_PATH" ] && rm -v "$LINK_PATH"
    # Create a symlink to the file
    ln -sv "$FILE_PATH" "$LINK_PATH"
}

if [ "$PWD" != "$HOME/.dotfiles" ]; then
    echo "Please execute bootstrap.sh from .dotfiles directory in $HOME"
    exit 1
else
    # Create any directories which don't exist.
    for DIR in ${DIRS[@]}; do
        echo $DIR
        create_dir "$DIR"
    done

    # Create the symlinks - assumes both arrays are the same length!
    for ((i = 0; i < ${#FILE_PATHS[@]}; i++)); do
        create_link "${FILE_PATHS[$i]}" "${LINK_PATHS[$i]}"
    done

    # Let's sort out all the vim submodules
    git submodule init
    git submodule update

    # source ~/.bash_profile
    cd $HOME
    echo "Initialisation complete!"
fi
