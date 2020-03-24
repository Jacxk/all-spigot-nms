#!/usr/bin/env bash

. ./util/title.sh
. ./util/menu.sh

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
    bash source/download.sh
  elif [ $choice = 1 ]; then
    bash source/extract.sh
  elif [ $choice = 2 ]; then
    bash source/compile.sh
  elif [ $choice = 3 ]; then
    bash source/download.sh
    bash source/extract.sh
    bash source/compile.sh
  elif [ $choice = 4 ]; then
    echo "Bye Bye..."
    exit
  fi

  make_menu
}

make_menu
