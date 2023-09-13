#!/bin/bash

# Heavily adapted from this post:
# https://www.reddit.com/r/unixporn/comments/10w7p5z/rofi_chatgpt_rofi/

INPUT=$(rofi -dmenu -p "󱚣")
if [[ -z $INPUT ]]; then
    exit 1
fi
ANSWER=$(~/anaconda3/bin/sgpt "$INPUT")
notify-send -i ~/Dropbox/openai.png --urgency=low "$ANSWER"
