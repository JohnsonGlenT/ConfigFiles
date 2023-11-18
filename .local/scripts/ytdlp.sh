#!/bin/sh
echo "$#"
if [ $# -eq 1 ]; then
    yt-dlp --embed-metadata --embed-thumbnail --audio-format m4a --extract-audio "$1"

fi
