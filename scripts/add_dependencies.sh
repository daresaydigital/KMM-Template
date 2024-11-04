#!/bin/bash

# Get branch names from parameters
branch1="$1"
branch2="$2"

# Get the diff output and extract dependency lines
diff_output=$(git diff "$branch1" "$branch2" -- shared/build.gradle.kts)
echo "-----------------------------"
echo "Diff output:"
echo "$diff_output"
echo "-----------------------------"

# Function to extract and add dependencies/plugins for a specific block
add_lines() {
  local target_block="$1"
  file_path="shared/build.gradle.kts"
  echo "$file_path"
  local lines=$(echo "$diff_output" | sed -n "/$target_block/,/}/p" | grep "^+" | sed 's/^+//' | sed 's/\\/\\\\/g; s/&/\\&/g')

  # Check if the target block is empty
  if grep -q "$target_block {[\t ]*}" shared/build.gradle.kts; then
    # If empty, add a newline before the closing brace
    # to run this command on iOS you have to add "" after -i. For instance, sed -i "/$target_block {/a \\" shared/build.gradle.kts
    sed -i "/$target_block {/a \\" shared/build.gradle.kts
  fi

  while IFS= read -r line; do
    # to run this command on iOS you have to add "" after -i. For instance, sed -i "/$target_block {/a \\" shared/build.gradle.kts
    sed -i "/$target_block {/,/}/s/$target_block {/$target_block {\n$line/1" "$file_path"
  done <<< "$lines"
}

# Add plugins
plugins=$(echo "$diff_output" | grep "^+[[:space:]]*alias" | sed 's/^+//')
echo "-----------------------------"
echo "Extracted plugins:"
echo "$plugins"
echo "-----------------------------"
file_path="shared/build.gradle.kts"

while IFS= read -r plugin; do
    echo "-----------------------------"
    echo "Adding plugin: $plugin"
    # to run this command on iOS you have to add "" after -i. For instance, sed -i "/$target_block {/a \\" shared/build.gradle.kts
    sed -i "/plugins {/,/}/s/plugins {/plugins {\n$plugin/1" shared/build.gradle.kts
    echo "-----------------------------"
done <<< "$plugins"

# Add dependencies for each target block
add_lines "androidMain.dependencies"
add_lines "commonMain.dependencies"
add_lines "iosMain.dependencies"

# Extract remaining diff lines that are not part of the plugins or dependencies blocks
remaining_diff=$(echo "$diff_output" | grep "^+" | grep -v "alias" | grep -v "implementation" | grep -v "++ b/shared/build.gradle.kts" | sed 's/^+//')

# Append remaining diff lines to the end of the file
if [ -n "$remaining_diff" ]; then
  echo "-----------------------------"
  echo "Appending remaining diff to the end of the file:"
  echo "$remaining_diff"
  echo "-----------------------------"
  echo "$remaining_diff" >> shared/build.gradle.kts
fi

# Remove duplicate lines containing 'alias' or 'implementation' from the file
awk '/alias|implementation/ { if (!seen[$0]++) print; next } { print }' shared/build.gradle.kts > temp && mv temp shared/build.gradle.kts

echo "-----------------------------"
echo "Dependencies, plugins, and remaining diff added successfully."
echo "-----------------------------"
