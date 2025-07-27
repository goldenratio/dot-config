#!/bin/bash

PID_FILE="/tmp/vlc-record.pid"
OUTPUT="$HOME/Videos/recording_$(date +%F_%T).mp4"

if [ -f "$PID_FILE" ]; then
    kill "$(cat $PID_FILE)"
    rm "$PID_FILE"
    notify-send "🎥 Screen recording stopped"
else
    # Use slop to get user-selected region: outputs "X Y WIDTH HEIGHT"
    GEOM=$(slop -f "%x %y %w %h")
    if [ -z "$GEOM" ]; then
        notify-send "❌ Screen recording canceled (no region selected)"
        exit 1
    fi

    read LEFT TOP WIDTH HEIGHT <<< "$GEOM"

    cvlc screen:// \
        --screen-fps=60 \
        --screen-top="$TOP" \
        --screen-left="$LEFT" \
        --screen-width="$WIDTH" \
        --screen-height="$HEIGHT" \
        --screen-follow-mouse \
        --sout "#transcode{vcodec=h264,acodec=none,vb=4000,scale=1}:std{access=file,mux=mp4,dst=$OUTPUT}" &

    echo $! > "$PID_FILE"
    notify-send "🎥 Screen recording started"
fi


## to capture pulse audio
# cvlc screen:// \
#   --screen-fps=30 \
#   --screen-follow-mouse \
#   --input-slave=pulse:// \
#   --sout "#transcode{vcodec=h264,acodec=mp4a,ab=128,vb=800,scale=1}:std{access=file,mux=mp4,dst=$OUTPUT}"
