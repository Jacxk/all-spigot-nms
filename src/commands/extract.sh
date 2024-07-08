#!/usr/bin/env bash

# Run this to ONLY extract the jars.

# Command to be used depending on OS
cmd="$(printenv ASNMSCMD)"

# If cmd is empty default to jar
if [ -z "$cmd" ]; then
  cmd=jar
fi

extract() {
  current_dir=$(pwd)
  input_folder=$1
  output_folder=$2

  cd $output_folder
  echo "Extracting all the spigot.jar files, please wait..."

  # Extract all files that match in holder
  for filename in ../$input_folder/spigot-1.*.jar; do
    saveCursorPosition
    echo_verbose "  ⭕️ $(basename ${filename})"

    # Loop through the needed folder and extract them.
    for dir in net/minecraft/server org/bukkit/craftbukkit com/mojang; do
      "$cmd" -xf "$filename" "$dir"

      if [ $? -ne 0 ]; then
        return 2
      fi
    done

    moveCursorToSavedPosition
    echo_verbose "  🟢 $(basename ${filename})"
  done

  delete_lines 24
  echo "✅ Extraction completed! Files located at: $output_folder/"
  cd $current_dir
}
