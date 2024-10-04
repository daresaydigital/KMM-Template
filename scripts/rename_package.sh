#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: Please provide the new package name as an argument."
  exit 1
fi

new_package="$1"
new_path="${new_package//./\/}"

find . -type f -exec perl -pi -e "s/co\.daresay\.kmmtemplate/$new_package/g" {} +

find . -type d -path "*/co/daresay/kmmtemplate" -execdir sh -c \
'
  old_path="$0"
  new_path="$1"
  mkdir -p "$new_path"
  mv "${old_path##*/}" "$new_path"
  parent_dir="${old_path%/*}"
  parent_dir="${parent_dir##*co/daresay/}"
  if [ ! -z "$parent_dir" ]; then
    mv "$new_path" "$parent_dir"
  fi
  rmdir "${old_path%/*}"
  rmdir "${old_path%/co/daresay}"
' "co/daresay/kmmtemplate" "$new_path" \;

exit 0
