#!/usr/bin/env bash

# Run this to ONLY extract the jars.

holder="extracted_files"
cmd="$(printenv ASNMSCMD)"
if [ -z "$cmd" ]; then
  cmd=jar
fi

cd ../../
mkdir "$holder" -p
cd "$holder"/ || exit

echo "Extracting all spigot.jar files, please wait..."

for filename in ../spigot_versions/spigot-1.*.jar; do
  echo "Currently extracting $filename..."
  "$cmd" -xf "$filename" net/minecraft/server
  "$cmd" -xf "$filename" org/bukkit/craftbukkit
  "$cmd" -xf "$filename" com/mojang
done

cd ../src/commands || exit

echo "Extraction completed!"
