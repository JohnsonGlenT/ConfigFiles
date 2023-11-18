#!/usr/bin/env bash

dst=$HOME/.local/bin
src=$(pwd)

for f in *.sh; do
    if [[ "$f" != "symlink.sh" ]]; then
        file="$(basename -s .sh "$f")"
        ln -s "$src/$f" "$dst/$file"
    fi

done
