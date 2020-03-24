#!/usr/bin/env bash

# Run this to ONLY extract the jars.

holder="extracted_files"
JDK_DIR="$(printenv JAVA_HOME)\\bin\\"

cd ../../
mkdir "$holder" -p
cd "$holder"/ || exit

echo "Extracting all spigot.jar files, please wait..."

for filename in ../spigot_versions/spigot-1.*.jar; do
  echo "Currently extracting $filename..."
  "${JDK_DIR}jar.exe" -xf "$filename" net/minecraft/server
  "${JDK_DIR}jar.exe" -xf "$filename" org/bukkit/craftbukkit
  "${JDK_DIR}jar.exe" -xf "$filename" com/mojang
done

cd ../bash/ || exit

echo "Extraction completed!"
