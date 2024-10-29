#!/bin/bash

# Get the diff output and extract dependency lines
diff_output=$(git diff compose_swift_ui ktor_swift_ui -- shared/build.gradle.kts)
echo "-----------------------------"
echo "Diff output:"
echo "$diff_output"
echo "-----------------------------"


# Function to extract and add dependencies/plugins for a specific block
add_lines() {
  local target_block="$1"
  file_path="shared/build.gradle.kts"
  local lines=$(echo "$diff_output" | sed -n "/$target_block/,/}/p" | grep "^+" | sed 's/^+//' | sed 's/\\/\\\\/g; s/&/\\&/g')

  # Check if the target block is empty
  if grep -q "$target_block {[\t ]*}" shared/build.gradle.kts; then
    # If empty, add a newline before the closing brace
    sed -i "/$target_block {/a \\" shared/build.gradle.kts
  fi

  while IFS= read -r line; do
    sed -i "" "/$target_block {/,/}/s/$target_block {/$target_block {\n$line/1" "$file_path"
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
    sed -i "" "/plugins {/,/}/s/plugins {/plugins {\n$plugin/1" "$file_path"
    echo "-----------------------------"
done <<< "$plugins"


# Add dependencies for each target block
add_lines "androidMain.dependencies"
add_lines "commonMain.dependencies"
add_lines "iosMain.dependencies"

echo "-----------------------------"
echo "Dependencies and plugins added successfully."
echo "-----------------------------"
