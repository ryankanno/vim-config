#!/bin/bash

VIMINSTALL=~/.vim-config

# Save previous links
function update_symlink() {
    SOURCE=$1
    TARGET=$2

    EPOCH=`(date +"%s")`

    if [ -L "${TARGET}" ]; then
        PREV_SYMLINK="${TARGET}_$EPOCH"
        cp -RP "${TARGET}" $PREV_SYMLINK
        rm -rf "${TARGET}"
        echo "Found existing ${TARGET} symlink, copying to $PREV_SYMLINK, removing original."
    elif [ -f "${TARGET}" ]; then
        PREV_FILE="${TARGET}_$EPOCH"
        mv "${TARGET}" $PREV_FILE
        echo "Found existing file ${TARGET}, renaming to $PREV_FILE."
    fi

    ln -nsf "$SOURCE" "$TARGET"

    echo "Created symlink from $SOURCE to $TARGET"
}

git clone git://github.com/ryankanno/vim-config.git "$VIMINSTALL"
cd "$VIMINSTALL"
git submodule update --init

update_symlink "$VIMINSTALL/.vim" "$HOME/.vim"
update_symlink "$VIMINSTALL/.vimrc" "$HOME/.vimrc"
