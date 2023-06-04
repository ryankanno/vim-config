#!/bin/bash

VIMINSTALL=~/.vim-config

# Save previous links
function update_symlink() {
    SOURCE=$1
    TARGET=$2

    EPOCH=`(date +"%s")`

    if [ -L "${TARGET}" ]; then
        PREV_SYMLINK="${TARGET}_$EPOCH"
        cp -rL "${TARGET}" $PREV_SYMLINK
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

if [[ -n "$1" && "$1" == "UNINSTALL" ]]; then 
    echo "Uninstalling from: $VIMINSTALL"
    rm -rf "$VIMINSTALL"
else
    if [[ -d "${VIMINSTALL}" && ! -L "${VIMINSTALL}" ]]; then # pull if installed
        cd "$VIMINSTALL"
        git pull "$VIMINSTALL"
    else                          # clone if not
        git clone git@github.com:ryankanno/vim-config.git "$VIMINSTALL"
    fi

    update_symlink "$VIMINSTALL/.vim" "$HOME/.vim"
    update_symlink "$VIMINSTALL/.vimrc" "$HOME/.vimrc"
fi
