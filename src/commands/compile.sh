#!/usr/bin/env bash

# Run this to extract and compile the jars.

# Folder where all the files are
holder="extracted_files"
# Command to be used depending on OS
cmd="$(printenv ASNMSCMD)"

# If cmd is empty default to jar
if [ -z "$cmd" ]; then
  cmd=jar
fi

# Go back two directories to find holder
cd ../../ || exit 1
mkdir "$holder" -p

echo "Creating all-spigot-nms.jar"

# Bundle all the files in a jar file
"$cmd" -cf all-spigot-nms.jar -C ./"$holder" .

echo "File created at: $holder/all-spigot-nms.jar"

# Go back to the commands folder
cd src/commands || exit 1
