#!/bin/bash

CACHE_DIR="/run/user/$(id -u)"

MOZILLA_COLD="/home/$USER/data/mozilla"
MOZILLA_HOT="$CACHE_DIR/mozilla"
MOZILLA_TARGET="/home/$USER/.mozilla"
if [ ! -f "$MOZILLA_HOT/ALIVE" ]; then 
  cp -fa "$MOZILLA_COLD" "$CACHE_DIR"
  ln -s "$MOZILLA_HOT/" "$MOZILLA_TARGET"
fi

MOZILLA_CACHE_COLD="/home/$USER/data/mozilla-cache"
MOZILLA_CACHE_HOT="$CACHE_DIR/mozilla-cache"
MOZILLA_CACHE_TARGET="/home/$USER/.cache/mozilla"
if [ ! -f "$MOZILLA_CACHE_HOT/ALIVE" ]; then 
  cp -fa "$MOZILLA_CACHE_COLD" "$CACHE_DIR"
  ln -s "$MOZILLA_CACHE_HOT/" "$MOZILLA_CACHE_TARGET"
fi

/home/$USER/bin/firefox/firefox-bin

rm "$MOZILLA_TARGET"
rsync -aq --delete "$MOZILLA_HOT/" "$MOZILLA_COLD/"
rm "$MOZILLA_HOT" -r

rm "$MOZILLA_CACHE_TARGET"
rsync -aq --delete "$MOZILLA_CACHE_HOT/" "$MOZILLA_CACHE_COLD/"
rm "$MOZILLA_CACHE_HOT" -r

