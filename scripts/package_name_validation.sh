#!/bin/bash

# Input package name
package_name="$1"

# Split package name by dots into an array
IFS='.' read -r -a package_parts <<< "$package_name"

# Java and Kotlin keywords
keywords=(
    "abstract" "assert" "boolean" "break" "byte" "case" "catch" "char" "class" "const"
    "continue" "default" "do" "double" "else" "enum" "extends" "false" "final" "finally"
    "float" "for" "goto" "if" "implements" "import" "instanceof" "int" "interface" "long"
    "native" "new" "null" "package" "private" "protected" "public" "return" "short" "static"
    "strictfp" "super" "switch" "synchronized" "this" "throw" "throws" "transient" "true"
    "try" "void" "volatile" "while"

    # Kotlin keywords
    "as" "as?" "break" "class" "continue" "do" "else" "false" "for" "fun" "if" "in"
    "interface" "is" "!is" "null" "object" "package" "return" "super" "this" "throw"
    "true" "try" "typealias" "typeof" "val" "var" "when" "while"
)

# Function to check if a string contains any of the keywords
contains_keyword() {
    for part in "${package_parts[@]}"; do
        local string="$part"
        echo "$string"
        for keyword in "${keywords[@]}"; do
            if [[ "$string" == "$keyword" ]]; then
                echo "$string"
                echo "$keyword"
                return 0  # Found a keyword
            fi
        done
    done
    return 1  # No keywords found
}

# Validate package name
if [[ -z "$package_name" ]]; then
    echo "Error: Package name cannot be empty."
    exit 1
elif [[ ! "$package_name" =~ ^([a-zA-Z_][a-zA-Z0-9_]*(\.)?)*[a-zA-Z_][a-zA-Z0-9_]*$ ]]; then
    echo "Error: Invalid package name format. It should follow Java package naming rules."
    exit 1
elif contains_keyword "$package_name"; then
    echo "Error: Package name contains Java or Kotlin keywords."
    exit 1
else
    echo "Package name is valid."
fi
