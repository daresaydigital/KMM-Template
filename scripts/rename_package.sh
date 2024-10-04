#!/bin/bash

find . -type f -exec perl -pi -e "s/co.daresay.kmmtemplate/$1/g" {} +

old_path="co/daresay/kmmtemplate"
new_path=$(echo "$1" | tr "." "/")

find . -type d -path "*/$old_path" -execdir sh -c \
'
  old_parts=(`echo "$0" | tr "/" " "`)
  new_path="$1"
  mkdir -p "$new_path"
  mv "${old_parts[2]}" "$new_path"
  rmdir "${old_parts[1]}"
  rmdir "${old_parts[0]}"
' "$old_path" "$new_path" \;

exit 0
