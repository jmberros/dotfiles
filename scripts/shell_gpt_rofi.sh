#!/bin/bash
INPUT=$(rofi -dmenu -p "󱚣")
if [[ -z $INPUT ]]; then
    exit 1
fi

# zenity --progress --text="Waiting for an answer" --pulsate &

if [[ $? -eq 1 ]]; then
    exit 1
fi

PID=$!

ANSWER=$(~/anaconda3/bin/sgpt "$INPUT")
kill $PID
# zenity --notification --text="$ANSWER"
notify-send -i ~/Dropbox/openai.png --urgency=low --expire-time=60000 "$ANSWER"
