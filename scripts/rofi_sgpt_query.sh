#!/bin/bash

# Heavily adapted from this post:
# https://www.reddit.com/r/unixporn/comments/10w7p5z/rofi_chatgpt_rofi/

# notify-send "en el script"
INPUT=$(rofi -dmenu -p "Prompt ChatGPT 󱚣 󱋊 :")
# notify-send "INPUT: $INPUT"
if [[ -z $INPUT ]]; then
    exit 1
fi
# ANSWER=$(~/anaconda3/bin/sgpt "$INPUT")
# notify-send -i ~/Dropbox/openai.png -t=60000 --urgency=low "$ANSWER"
OUTPUT_FILENAME=/tmp/sgpt-response.txt
# notify-send "OUT FILE: $OUTPUT_FILENAME"
ANSWER=$(~/anaconda3/bin/sgpt "$INPUT")
# notify-send "ANSWER: $ANSWER"
echo "<span style='font-size: 26px;'>${ANSWER}</span>" > "$OUTPUT_FILENAME"
zenity --text-info --width 600 --height 500 --html --filename="$OUTPUT_FILENAME"
# zenity --info --text="$ANSWER" --icon="~/Dropbox/openai.png"
