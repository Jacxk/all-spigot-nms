#!/usr/bin/env bash

. ./util/title.sh
. ./util/menu.sh

cd ./commands/ || exit 1

make_menu() {
  echo "What do would you like to do today? (Use arrow keys to move, and Enter to select)"
  echo
  options=(
    "Download"
    "Extract"
    "Compile"
    "All of the above"
    "Exit"
  )
  select_option "${options[@]}"
  choice=$?

  echo "Running ${options[$choice]}..."
  if [ $choice = 0 ]; then
    bash ./download.sh
  elif [ $choice = 1 ]; then
    bash ./extract.sh
  elif [ $choice = 2 ]; then
    bash ./compile.sh
  elif [ $choice = 3 ]; then
    bash ./download.sh
    bash ./extract.sh
    bash ./compile.sh
  elif [ $choice = 4 ]; then
    echo "Bye Bye..."
    exit
  fi

  make_menu
}

make_menu
