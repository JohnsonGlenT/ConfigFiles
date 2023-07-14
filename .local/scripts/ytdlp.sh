#!/bin/sh
echo "$#"
if [ $# -eq 1 ]; then
    yt-dlp --embed-metadata --embed-thumbnail --audio-format m4a --extract-audio "$1"

    for f in *.m4a; do
        mp4art --extract "$f"
        base=$(basename -s .m4a "$f")
        mv "$base.art[0].png" "$base.png"
    done

    ffmpeg -i "$f" -i "$base.png" -map_metadata 0 -map_metadata 0:s:0 "$base.ogg"

fi
