#!/bin/bash

# Run this to ONLY extract the jars.

holder="extracted_files"

cd ..
mkdir "$holder" -p
cd "$holder"/

echo "Extracting all spigot.jar files, please wait..."

for filename in ../spigot_versions/spigot-1.*.jar; do
    unzip -uoq "$filename" 'org/bukkit/craftbukkit/**' -x "META-INF/*"
    unzip -uoq "$filename" 'net/minecraft/server/**' -x "META-INF/*"
done

cd ..
cd bash/

echo "Extract completed!"