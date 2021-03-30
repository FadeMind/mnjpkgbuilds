#!/usr/bin/bash
for old in *; do
    new="$(echo "$old" | sed -e 's/svg$/new.svg/')"
    rsvg-convert "$old" -w 160 -h 160 -f svg -o "$new"
done
