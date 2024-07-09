#!/usr/bin/env bash

# Run this to download all the available jars.

# All the NMS versions available
legacy_versions=(
  "spigot-1.8-R0.1-SNAPSHOT-latest"
  "spigot-1.8.3-R0.1-SNAPSHOT-latest"
  "spigot-1.8.8-R0.1-SNAPSHOT-latest"
  "spigot-1.9.2-R0.1-SNAPSHOT-latest"
  "spigot-1.9.4-R0.1-SNAPSHOT-latest"
  "spigot-1.10.2-R0.1-SNAPSHOT-latest"
  "spigot-1.11.2"
  "spigot-1.12.2"
  "spigot-1.13"
  "spigot-1.13.2"
  "spigot-1.14.4"
  "spigot-1.15.2"
  "spigot-1.16.1"
  "spigot-1.16.3"
  "spigot-1.16.5"
)

new_versions=(
  "spigot-1.17.1"
)

legacy_url="https://cdn.getbukkit.org/spigot"
new_url="https://download.getbukkit.org/spigot"

function _download_jars {
  local version=$1
  local url=$2
  local output=$3

  saveCursorPosition
  echo_verbose "  ⭕️ $version"

  curl_command() {
    curl --fail "$url/$version".jar --output "$output/$version".jar --progress-bar
  }

  if [ $verbose -eq 0 ]; then
    curl_command() {
      curl -s "$url/$version".jar --output "$output/$version".jar > /dev/null
    }
  fi

  # Download the jar file to the output folder.
  #   Also saves the cursor and replaces the printed string for less clutter
  if curl_command; then
    moveCursorToSavedPosition
    echo_verbose "  🟢 $version"
    deleteLine
  else
    # If the download fails stop the execution
    return 1
  fi
}

function download {
  check_internet_connection

  local output_folder=$1
  echo Downloading all available jar files

  # Download all legacy versions from cdn.getbukkit.org on dir spigot_versions
  for version in "${legacy_versions[@]}"; do
    _download_jars $version $legacy_url $output_folder

    RETURN_CODE=$?
    if [ $RETURN_CODE -ne 0 ]; then
      return $RETURN_CODE
    fi
  done

  # Download all versions from download.getbukkit.org on dir spigot_versions
  for version in "${new_versions[@]}"; do
    _download_jars $version $new_url $output_folder

    RETURN_CODE=$?
    if [ $RETURN_CODE -ne 0 ]; then
      return $RETURN_CODE
    fi
  done

  delete_lines 24
  echo ✅ Successfully downloaded all available versions! Files located at: $output_folder
}
