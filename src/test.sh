#!/usr/bin/env bash

# Test if the file was created an contains all the NMS files

echo Starting test...
bash run.sh -cxk

# List containing all files
legacy_list=(
    v1_8_R1 v1_8_R2 v1_8_R3 v1_9_R1 v1_9_R2 v1_10_R1
    v1_11_R1 v1_12_R1 v1_13_R1 v1_13_R2 v1_14_R1
    v1_15_R1 v1_16_R1 v1_16_R2 v1_16_R3
)
# List containing only certain files
extra_list=(v1_17_R1)

jar_file="out/all-spigot-nms.jar"
missing_folders=0

function join_by {
  local d=${1-} f=${2-}
  if shift 2; then
    printf %s "$f" "${@/#/$d}"
  fi
}

function check_for_folder {
  local folder=$1
  local list=(${@:2})

  contents=$(jar -tf "$jar_file")

  # Check each version in the list
  for version in "${list[@]}"; do
    if ! echo "$contents" | grep -q "$folder/$version"; then
      echo "'$folder/$version' is missing"
      missing_folders=1
    else
      echo_verbose "'$folder/$version' was found"
    fi
  done
}

if [ -f "$jar_file" ]; then

  net_minecraft_folder="net/minecraft/server"
  org_bukkit_folder="org/bukkit/craftbukkit"

  concated_list=("${legacy_list[@]}" "${extra_list[@]}")

  check_for_folder $org_bukkit_folder ${concated_list[@]}
  check_for_folder $net_minecraft_folder ${legacy_list[@]}

else
  echo ❌ Test failded... could not find $jar_file
  exit 1
fi

if [ $missing_folders -eq 1 ]; then
  echo ❌ Tests failed due to contents missing. Check above to see which.
  exit 1
fi

echo ✅ Test completed. No issues where found.