#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: Please provide the new package name as an argument."
  exit 1
fi

new_package="$1"
new_path="${new_package//./\/}"

find . -type f -exec perl -pi -e "s/co\.daresay\.kmmtemplate/$new_package/g" {} +

new_path=$(echo "$1" | tr "." "/")

path="composeApp/src/androidMain/kotlin/co/daresay/kmmtemplate"

# Construct the new path
new_full_path="composeApp/src/androidMain/kotlin/$new_path"

# Move the kmmtemplate folder and its contents
mkdir "$new_full_path"
mv "$path" "$new_full_path"

# Extract the part to be removed
remove_part="${path%/*co*}"

# Remove the folders if they exist
if [ -d "$remove_part" ]; then
  rm -rf "$remove_part"
fi

exit 0
