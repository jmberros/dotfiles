#!/usr/bin/env bash

TIDAL_HOST="http://localhost:47836"

function usage() {
  cat<<EOF
Usage: $(basename "$0") [play|pause|playpause|next|previous|info|status|help]
EOF
}

function httpGet() {
	curl -s "$TIDAL_HOST/$1"
}

function httpSilentGet() {
	curl -s -o /dev/null "$TIDAL_HOST/$1"
}

function main() {
  case $1 in
  "play")
    httpSilentGet play
    ;;
  "pause")
    httpSilentGet pause
    ;;
  "playpause")
    httpSilentGet playpause
    ;;
  "next")
    httpSilentGet next
    ;;
  "previous")
    httpSilentGet previous
    ;;
  "info")
    JSON=$(httpGet current)
    if [ -z "$JSON" ]; then
      echo "tidal-hifi not running"
    else
      TITLE=$(echo "$JSON" | jq -r '.title')
      ARTISTS=$(echo "$JSON" | jq -r '.artist')
      INFO="$TITLE - $ARTISTS"
      echo "$INFO"
    fi
    ;;

  "scroll")
    zscroll -l 35 \
            --delay 0.1 \
            --match-command "`dirname $0`/tidal.sh status" \
            --match-text "playing" "--before-text '  ' --scroll 1" \
            --match-text "pause" "--before-text '  ' --scroll 0" \
            --update-check true "`dirname $0`/tidal.sh info" &
    wait
    ;;

  "status")
    if httpGet current | grep "paused" >/dev/null; then
      echo "paused"
    else
      echo "playing"
    fi
    ;;
  "help")
    usage
    ;;
  *)
    echo "Unknown command"
    usage
    ;;
  esac
}

main "$1"
