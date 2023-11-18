#!/bin/bash

if [ $# -ne 0 ]; then
    echo "Wrong Arguments: works in current directory"
    exit
fi

MIMIC_CMD="mimic3 -v en_US/cmu-arctic_low#eey --output-naming time --output-dir tmp/ --process-on-blank-line"

if [ ! -d tmp ]; then
    mkdir tmp
elif [ "$(ls -A tmp)" ]; then
    echo "tmp dir not empty"
    echo "empy before running"
    exit
fi

FILE_COUNT=$(find . -maxdepth 1 -type f -name '*.txt' | wc -l)

for f in *.txt; do
    if [[ "chapter_list.txt" == "$f" ]]; then
        continue
    fi

    BASE=$(basename -s .txt "$f")

    echo "Converting $f out of $FILE_COUNT"
    if [ -f "$BASE.mp3" ]; then
        echo "skipped -- mp3 already generated"
        echo ""
        continue
    fi

    $MIMIC_CMD <"$f"
    echo "converting loose files into one"
    python3 ~/.local/scripts/wav_merger.py
    mv tmp/output.wav "$BASE.wav"

    rm -r tmp/*

    echo "converting into mp3 to reduce filesize"
    ffmpeg -i "$BASE.wav" "$BASE.mp3" -v 8
    rm -f "$BASE.wav"

    echo ""

done

rmdir tmp
