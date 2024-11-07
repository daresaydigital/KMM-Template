#!/bin/bash

# Get branch names from parameters
branch1="$1"
branch2="$2"

# Determine the file path based on the branch1 value
if [[ "$branch1" == "compose_swift_ui" ]]; then
  file_path="shared/build.gradle.kts"
else
  file_path="composeApp/build.gradle.kts"
fi

# Get the diff output and extract dependency lines
diff_output=$(git diff "$branch1" "$branch2" -- "$file_path")
echo "-----------------------------"
echo "Diff output:"
echo "$diff_output"
echo "-----------------------------"

# Function to extract and add dependencies/plugins for a specific block
add_lines() {
  local target_block="$1"
  local lines=$(echo "$diff_output" | sed -n "/$target_block/,/}/p" | grep "^+" | sed 's/^+//' | sed 's/\\/\\\\/g; s/&/\\&/g')

  # Check if the target block is empty
  if grep -q "$target_block {[\t ]*}" "$file_path"; then
    # If empty, add a newline before the closing brace
    sed -i "/$target_block {/a \\" "$file_path"
  fi

  while IFS= read -r line; do
    sed -i "/$target_block {/,/}/s/$target_block {/$target_block {\n$line/1" "$file_path"
  done <<< "$lines"
}

# Add plugins
plugins=$(echo "$diff_output" | grep "^+[[:space:]]*alias" | sed 's/^+//')
echo "-----------------------------"
echo "Extracted plugins:"
echo "$plugins"
echo "-----------------------------"

while IFS= read -r plugin; do
  echo "-----------------------------"
  echo "Adding plugin: $plugin"
  sed -i "/plugins {/,/}/s/plugins {/plugins {\n$plugin/1" "$file_path"
  echo "-----------------------------"
done <<< "$plugins"

# Add dependencies for each target block
add_lines "androidMain.dependencies"
add_lines "commonMain.dependencies"
add_lines "iosMain.dependencies"

# Extract remaining diff lines that are not part of the plugins or dependencies blocks
remaining_diff=$(echo "$diff_output" | grep "^+" | grep -v "alias" | grep -v "implementation" | grep -v "++ b/$file_path" | sed 's/^+//')

# Append remaining diff lines to the end of the file
if [ -n "$remaining_diff" ]; then
  echo "-----------------------------"
  echo "Appending remaining diff to the end of the file:"
  echo "$remaining_diff"
  echo "-----------------------------"
  echo "$remaining_diff" >> "$file_path"
fi

# Remove duplicate lines containing 'alias' or 'implementation' from the file
awk '/alias|implementation/ { if (!seen[$0]++) print; next } { print }' "$file_path" > temp && mv temp "$file_path"

echo "-----------------------------"
echo "Dependencies, plugins, and remaining diff added successfully."
echo "-----------------------------"
