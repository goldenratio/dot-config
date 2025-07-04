#!/bin/bash

PID_FILE="/tmp/vlc-record.pid"
OUTPUT="$HOME/Videos/recording_$(date +%F_%T).mp4"

if [ -f "$PID_FILE" ]; then
    kill "$(cat $PID_FILE)"
    rm "$PID_FILE"
    notify-send "🎥 Screen recording stopped"
else
    cvlc screen:// \
        --screen-fps=60 \
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
