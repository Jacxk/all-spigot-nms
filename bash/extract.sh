#!/bin/bash

# Run this to ONLY extract the jars.

holder="../extracted_files"
mkdir "$holder" -p

echo "Extracting all spigot.jar files, please wait..."
cd "$holder"/
for filename in /spigot_versions/spigot-1.*.jar; do
    unzip -uoq ../"$filename" 'org/bukkit/craftbukkit/**' -x "META-INF/*"
    unzip -uoq ../"$filename" 'net/minecraft/server/**' -x "META-INF/*"
done
cd ..

echo "Extract completed!"