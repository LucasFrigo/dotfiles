#!/bin/bash

SOURCE_DIR=~/.config
DEST_DIR=~/repositories/dotfiles

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory $SOURCE_DIR does not exist."
  exit 1
fi

mkdir -p "$DEST_DIR"

cp -r "$SOURCE_DIR/"* "$DEST_DIR/"

echo "Dotfiles pulled from $DEST_DIR successfully."
