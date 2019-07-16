#!/bin/bash

# Run this to download all the available jars.

debug=false
success=true

while getopts ":d" option; do
    case "${option}" in
        d ) debug=true ;;
    esac
done

versions=(
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
"spigot-1.14.2"
)

mkdir ../spigot_versions/ -p
cd ../spigot_versions/

for version in "${versions[@]}"
do
    echo -e "Downloading \e[34m$version\e[39m...\e[39m"
    if "$debug" = true; then
        if curl --fail https://cdn.getbukkit.org/spigot/"$version".jar --output "$version".jar; then
            echo -e "Downloaded \e[34m$version \e[39msuccessfully!"
            success=true
        else
            echo -e "\e[91mSome went wrong!\e[39m"
            success=false
        fi
    else
        if curl --fail -s https://cdn.getbukkit.org/spigot/"$version".jar --output "$version".jar; then
            echo -e "Downloaded \e[34m$version \e[39msuccessfully!"
            success=true
        else
            echo -e "\e[91mSome went wrong! Use run this script using -d to display the output\e[39m"
            success=false
        fi
    fi
    echo ""
done

cd ./bash
if "$success" = true; then
    echo \e[32mSuccessfully downloaded all available versions!\e[39m
fi