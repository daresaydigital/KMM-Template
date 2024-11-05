#!/bin/bash

# Remove non-empty duplicate lines from the file
awk 'NF { if (!seen[$0]++) print }' gradle/libs.versions.toml > temp && mv temp gradle/libs.versions.toml

echo "Non-empty duplicate lines removed successfully from gradle/libs.versions.toml."
