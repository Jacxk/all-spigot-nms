#!/usr/bin/env bash

# Run this to ONLY extract the jars.

# Folder where all the files will be extracted to
holder="extracted_files"
# Command to be used depending on OS
cmd="$(printenv ASNMSCMD)"

# If cmd is empty default to jar
if [ -z "$cmd" ]; then
  cmd=jar
fi

# Go back two directories to find holder and created it of it doesnt exist
cd ../../
mkdir "$holder" -p

cd "$holder"/ || exit 1

echo "Extracting all spigot.jar files, please wait..."

# Extract all files that match in holder
for filename in ../spigot_versions/spigot-1.*.jar; do
  echo "Currently extracting $filename..."
  "$cmd" -xf "$filename" net/minecraft/server
  "$cmd" -xf "$filename" org/bukkit/craftbukkit
  "$cmd" -xf "$filename" com/mojang
done

echo "Extraction completed!"

# Go back to the commands folder
cd ../src/commands || exit 1
