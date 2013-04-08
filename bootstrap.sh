#!/bin/bash

# Config files within the repository
FILE_PATHS=(
    "$HOME/.dotfiles/git/gitconfig"
    "$HOME/.dotfiles/git/gitignore_global"
    "$HOME/.dotfiles/hg/hgrc"
    "$HOME/.dotfiles/hg/hgignore"
)

# Paths at which we want to create symlinks to the config files
LINK_PATHS=(
    "$HOME/.gitconfig"
    "$HOME/.gitignore_global"
    "$HOME/.hgrc"
    "$HOME/.hgignore"
)

function create_link() {
    FILE_PATH=$1
    LINK_PATH=$2

    # Remove other files (-h => only if they're symlinks already => a bit safer)
    [ -h $LINK_PATH ] && rm -v $LINK_PATH
    # Create a symlink to the file
    ln -sv $FILE_PATH $LINK_PATH
}

if [ "$PWD" != "$HOME/.dotfiles" ]; then
    echo "Please execute bootstap.sh from .dotfiles directory in $HOME"
    exit 1
else
    # Check we're up to date
    git pull

    # Assumes both arrays are the same length!
    for ((i = 0; i < ${#FILE_PATHS[@]}; i++))
    do
        create_link ${FILE_PATHS[$i]} ${LINK_PATHS[$i]}
    done

    # Let's sort out all the vim submodules
    git submodule init
    git submodule update

    # source ~/.bash_profile
    cd $HOME
    echo "Initialisation complete!"
fi
