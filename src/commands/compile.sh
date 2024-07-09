#!/usr/bin/env bash

# Run this to compile the jar using the extracted files.

# Command to be used depending on OS
cmd="$(printenv ASNMSCMD)"

# If cmd is empty default to jar
if [ -z "$cmd" ]; then
  cmd=jar
fi

compile() {
  local output_folder='out'
  local output_file=all-spigot-nms.jar
  local input_folder=$1
  local output="$output_folder/$output_file"

  if [ ! "$(ls -A $input_folder)" ]; then
    echo "The folder: $input_folder/ does not exist or is empty."
    return 3
  fi

  mkdir -p $output_folder
  echo Creating $output_file

  # Remove file if it exists
  rm -f -- $output
  # Bundle all the files in a jar file
  "$cmd" -cf $output -C "$input_folder" .

  RETURN_CODE=$?
  if [ $RETURN_CODE -ne 0 ]; then
    return 3
  fi

  delete_lines 1
  echo ✅ File created at: $output
}
