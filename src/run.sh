#!/usr/bin/env bash

# Import all the util files
. ./util/title.sh
. ./util/menu.sh
. ./util/args.sh

# Enter the commands folder
cd ./commands/ || exit 1

make_menu() {
  check_os

  echo "Detected OS: $(uname). Using $(printenv ASNMSCMD)"
  echo "What do would you like to do today? (Use arrow keys to move, and Enter to select)"
  echo

  # If no flag added to the command, create an interactive menu
  if [[ "$choice" == 89 ]]; then
    options=(
      "Download"
      "Extract"
      "Compile"
      "All the above"
      "Exit"
    )
    select_option "${options[@]}"
    choice=$?
  fi

  echo "Running ${options[$choice]}..."
  if [ $choice = 0 ]; then
    bash ./download.sh
  elif [ $choice = 1 ]; then
    bash ./extract.sh
  elif [ $choice = 2 ]; then
    bash ./compile.sh
  elif [ $choice = 3 ]; then
    bash ./download.sh

    # If the exit code of the last command was success,
    # execute the other command, else exit with error
    if [[ $(echo "$?") == 0 ]]; then
      bash ./extract.sh
    else
      exit 1
    fi

    # If the exit code of the last command was success,
    # execute the other command, else exit with error
    if [[ $(echo "$?") == 0 ]]; then
      bash ./compile.sh
    else
      exit 1
    fi
  elif [ $choice = 4 ]; then
    echo "Bye Bye..."
    unset ASNMSCMD
    exit 0
  fi

  make_menu
}

# Check which OS is the command running on
check_os() {
  OS=$(uname)

  # If its Linux or Mac, use command jar
  # Else find jar.exe using JAVA_HOME
  if [[ $OS == Linux* ]] || [[ $OS == Darwin* ]]; then
    export ASNMSCMD=jar
  else
    java_home="$(printenv JAVA_HOME)"
    if [ -z "$java_home" ]; then
      export ASNMSCMD=jar
    else
      export ASNMSCMD="$java_home\bin\jar.exe"
    fi
  fi
}

make_menu
