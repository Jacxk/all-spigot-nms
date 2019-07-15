#!/bin/bash

# Run this to extract and compile the jars.

holder="extracted_files"
mkdir "$holder" -p
echo "Extracting all spigot.jar files, please wait..."
for filename in /spigot_versions/spigot-1.*.jar; do
	cd "$holder"/
	unzip -uoq ../"$filename" 'org/bukkit/craftbukkit/**' -x "META-INF/*"
	unzip -uoq ../"$filename" 'net/minecraft/server/**' -x "META-INF/*"
	cd ..
done
echo "Extract completed!"
echo "Creating spigot-all-nms.jar"
jar -cvf spigot-all-nms.jar -C "$holder" .
echo "Deleting $holder folder!"
rm -r "$holder"/
echo "Finished!"