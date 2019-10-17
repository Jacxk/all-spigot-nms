#!/bin/bash

# Run this to ONLY extract the jars.

holder="extracted_files"

cd ..
mkdir "$holder" -p
cd "$holder"/

echo "Extracting all spigot.jar files, please wait..."

for filename in ../spigot_versions/spigot-1.*.jar; do
    echo "Currently extracting $filename..."
    unzip -uoq "$filename" 'org/bukkit/craftbukkit/**' -x **/Main*.class **/META-INF/**
    unzip -uoq "$filename" 'net/minecraft/server/**' -x **/Main*.class **/META-INF/**
    unzip -uoq "$filename" 'com/mojang/**' -x **/Main*.class **/META-INF/**
done

cd ..
cd bash/

echo "Extract completed!"
read -p "Press [ENTER] key to continue..."