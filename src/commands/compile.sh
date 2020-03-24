#!/usr/bin/env bash

# Run this to extract and compile the jars.

holder="extracted_files"
JDK_DIR="$(printenv JAVA_HOME)\\bin\\"

cd ../../
echo "Creating spigot-all-nms.jar"
"${JDK_DIR}jar.exe" -cf all-spigot-nms.jar -C "$holder" .

echo "Finished!"
