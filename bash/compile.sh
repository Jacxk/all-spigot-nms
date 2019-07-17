#!/bin/bash

# Run this to extract and compile the jars.

holder="extracted_files"

bash extract.sh

cd ..
echo "Creating spigot-all-nms.jar"
jar -cvf all-spigot-nms.jar -C "$holder" .

echo "Finished!"