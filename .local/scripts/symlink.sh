#!/usr/bin/env sh

dst=$HOME/.local/bin
src=$(pwd)

for f in *.sh; do
    file="$(basename -s .sh "$f")"

    #echo "src: $src/$f dst: $dst/$file"
    ln -s "$src/$f" "$dst/$file"

done
