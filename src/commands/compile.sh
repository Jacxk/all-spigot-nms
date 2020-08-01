#!/usr/bin/env bash

# Run this to extract and compile the jars.

holder="extracted_files"
cmd="$(printenv ASNMSCMD)"
if [ -z "$cmd" ]; then
  cmd=jar
fi

cd ../../

echo "Creating spigot-all-nms.jar"
"$cmd" -cf all-spigot-nms.jar -C "$holder" .

echo "Finished!"
