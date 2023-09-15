#!/bin/bash

INPUT=$(rofi -dmenu -p " oogle Feeling Lucky 󰣎 :")
if [[ -z $INPUT ]]; then
    exit 1  
fi
google-chrome "https://duckduckgo.com/?q=%5C${INPUT}"

