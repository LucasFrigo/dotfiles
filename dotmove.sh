#!/bin/bash

SOURCE_DIR=~/repositories/dotfiles
DEST_DIR=~/.config

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory $SOURCE_DIR does not exist."
  exit 1
fi

mkdir -p "$DEST_DIR"

cp "$SOURCE_DIR/"* "$DEST_DIR/"

echo "Dotfiles moved to $DEST_DIR successfully."

