#!/bin/bash

if [ -z "$1" ]; then
  echo "Error: Please provide the new package name as an argument."
  exit 1
fi

new_package="$1"
new_path="${new_package//./\/}"

find . -type f -exec perl -pi -e "s/co\.daresay\.kmmtemplate/$new_package/g" {} +

new_path=$(echo "$1" | tr "." "/")

# Define arrays for paths
paths=("composeApp/src/androidMain/kotlin/co/daresay/kmmtemplate" "shared/src/androidMain/kotlin/co/daresay/kmmtemplate" "shared/src/commonMain/kotlin/co/daresay/kmmtemplate" "shared/src/iosMain/kotlin/co/daresay/kmmtemplate" "shared/src/commonMain/sqldelight/co/daresay/kmmtemplate" "composeApp/src/commonMain/kotlin/co/daresay/kmmtemplate" "composeApp/src/iosMain/kotlin/co/daresay/kmmtemplate" "composeApp/src/commonMain/sqldelight/co/daresay/kmmtemplate")
new_paths=("composeApp/src/androidMain/kotlin/$new_path" "shared/src/androidMain/kotlin/$new_path" "shared/src/commonMain/kotlin/$new_path" "shared/src/iosMain/kotlin/$new_path" "shared/src/commonMain/sqldelight/$new_path" "composeApp/src/commonMain/kotlin/$new_path" "composeApp/src/iosMain/kotlin/$new_path" "composeApp/src/commonMain/sqldelight/$new_path")
delete_paths=("composeApp/src/androidMain/kotlin/co" "shared/src/androidMain/kotlin/co" "shared/src/commonMain/kotlin/co" "shared/src/iosMain/kotlin/co" "shared/src/commonMain/sqldelight/co" "composeApp/src/commonMain/kotlin/co" "composeApp/src/iosMain/kotlin/co" "composeApp/src/commonMain/sqldelight/co")

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
