#!/usr/bin/env bash

# Run this to compile the jar using the extracted files.

# Command to be used depending on OS
cmd="$(printenv ASNMSCMD)"
output_folder=out
output_file=all-spigot-nms.jar

# If cmd is empty default to jar
if [ -z "$cmd" ]; then
  cmd=jar
fi

compile() {
  input_folder=$1
  output="$output_folder/$output_file"
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
