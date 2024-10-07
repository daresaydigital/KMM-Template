#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: Please provide the new package name as an argument."
  exit 1
fi

new_package="$1"
new_path="${new_package//./\/}"

find . -type f -exec perl -pi -e "s/co\.daresay\.kmmtemplate/$new_package/g" {} +

new_path=$(echo "$1" | tr "." "/")

#path="composeApp/src/androidMain/kotlin/co/daresay/kmmtemplate"
#path1="shared/src/androidMain/kotlin/co/daresay/kmmtemplate"
#
## Construct the new path
#new_full_path="composeApp/src/androidMain/kotlin/$new_path"
#new_full_path1="shared/src/androidMain/kotlin/$new_path"
#
## Move the kmmtemplate folder and its contents
#mkdir -p "$new_full_path"
#mkdir -p "$new_full_path1"
#
## Move all files and subfolders
#rsync -av "$path"/ "$new_full_path"
#rsync -av "$path1"/ "$new_full_path1"
#
## Delete the 'co' folder and its contents
#rm -rf "composeApp/src/androidMain/kotlin/co" || echo "Error deleting 'co' folder"
#rm -rf "shared/src/androidMain/kotlin/co" || echo "Error deleting 'co' folder"

################
# Define arrays for paths
paths=("composeApp/src/androidMain/kotlin/co/daresay/kmmtemplate" "shared/src/androidMain/kotlin/co/daresay/kmmtemplate" "shared/src/commonMain/kotlin/co/daresay/kmmtemplate" "shared/src/iosMain/kotlin/co/daresay/kmmtemplate")
new_paths=("composeApp/src/androidMain/kotlin/$new_path" "shared/src/androidMain/kotlin/$new_path" "shared/src/commonMain/kotlin/$new_path" "shared/src/iosMain/kotlin/$new_path")
delete_paths=("composeApp/src/androidMain/kotlin/co" "shared/src/androidMain/kotlin/co" "shared/src/commonMain/kotlin/co" "shared/src/iosMain/kotlin/co")

# Loop through the paths and perform operations
for i in "${!paths[@]}"; do
    path="${paths[$i]}"
    new_full_path="${new_paths[$i]}"
    delete_path="${delete_paths[$i]}"

    # Move the kmmtemplate folder and its contents
    mkdir -p "$new_full_path"

    # Move all files and subfolders
    rsync -av "$path"/ "$new_full_path"

    # Delete the 'co' folder and its contents
    rm -rf "$delete_path" || echo "Error deleting '$delete_path' folder"
done

exit 0
