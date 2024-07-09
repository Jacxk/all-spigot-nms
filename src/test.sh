#!/usr/bin/env bash

# Test if the file was created an contains all the NMS files

echo Starting test...
bash run.sh -axk

function join_by {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
}

filename='out/all-spigot-nms.jar'
list=(
    v1_8_R1 v1_8_R2 v1_8_R3 v1_9_R1 v1_9_R2 v1_10_R1
    v1_11_R1 v1_12_R1 v1_13_R1 v1_13_R2 v1_14_R1
    v1_15_R1 v1_16_R1 v1_16_R2 v1_16_R3 v1_17_R1
    v1_18_R1 v1_18_R2 v1_19_R1 v1_19_R2 v1_19_R3
    v1_20_R1 v1_20_R2 v1_20_R3
)

jar_file="out/all-spigot-nms.jar"
if [ -f "$filename" ]; then
  contents=$(jar -tf "$jar_file")
  missing=0

  # Check each version in the list
  for version in "${list[@]}"; do
    net_minecraft_folder="net/minecraft/server/$version"
    org_bukkit_folder="org/bukkit/craftbukkit/$version"
    
    if ! echo "$contents" | grep -q "$net_minecraft_folder"; then
        echo "'$net_minecraft_folder' is missing"
        missing=1
    fi
    
    if ! echo "$contents" | grep -q "$org_bukkit_folder"; then
        echo "'$org_bukkit_folder' is missing"
        missing=1
    fi
  done
else
  echo Test failded... could not find $jar_file
  exit 1
fi

if [ $missing -eq 1 ]; then
  echo Test failed due to missing files
  exit 1
fi