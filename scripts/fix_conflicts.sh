#!/bin/bash

# Files to process
files=("shared/build.gradle.kts" "gradle/libs.versions.toml")

# Iterate through each file
for file in "${files[@]}"; do
    # Create a temporary file
    temp_file=$(mktemp)

    # Remove lines containing conflict markers and write to the temporary file
    grep -v -e '<<<<<<<\|=======\|>>>>>>>' "$file" > "$temp_file"

    # Move the temporary file to the original file, overwriting it
    mv "$temp_file" "$file"

    echo "Conflict markers removed and file rewritten: $file"
done

exit 0
