#!/bin/bash

# Change this to match the top-level of where all your videos are stored\
VIDEOLIB="/Users/Venudhar/Downloads/12Sep/MSICS"

shopt -s nullglob nocaseglob

# Loop through all mp4 files in the current dorectory
for image in *jpg; do

   # Get this file's inode number (unique id)
   inode=$(stat -f "%i" "$image")

   # Now find a friend with same name but different inode number
   friend=$(find "$VIDEOLIB" -name "$image" \! -inum $inode)

   if [ -z "$friend" ] ; then
      echo "ERROR: $image has no friend"
   else
      echo "$image is friends with:"
      echo "   $friend"
  cp "$image" "$friend"
	fi
done