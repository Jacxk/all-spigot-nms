#!/usr/bin/env bash

# Import all the util files
source src/util/args.sh
source src/util/helpers.sh
source src/util/menu.sh
source src/util/exist.sh
source src/util/print_utils.sh

# Import commands
source src/commands/download.sh
source src/commands/compile.sh
source src/commands/extract.sh

# Run the command specified by the choice made on the menu
run_command() {
  mkdir -p spigot_versions
  mkdir -p extracted_files

  case $1 in
  [0])
    download spigot_versions
    ;;
  [1])
    extract spigot_versions extracted_files
    ;;
  [2])
    compile extracted_files;;
  esac

  if [ $? -ne 0 ]; then
    echo 🔴 Something went wrong while performing the selected action!
  fi

  # Delete all output and re-render the menu
  if [ $2 == 1 ] && [ $is_interactive == 1 ]; then
    choice=89
    moveCursorUp
    delete_lines 21
    moveCursorDown
    execute
  fi
}

execute() {
  print_title
  check_os
  echo

  flag=false
  # If no flag added to the command, create an interactive menu
  if [[ "$choice" == 89 ]]; then

    echo "What do would you like to do today? (Use arrow keys to move, and Enter to select)"
    echo 

    # Set mode as interactive
    is_interactive=1
    # Options to display on menu
    options=(
      "Download"
      "Extract"
      "Compile"
      "All the above"
      "Exit"
    )
    select_option "${options[@]}"
    choice=$?

    delete_lines 9
  else
    flag=true
  fi

  if [ $choice = 3 ]; then
    echo Performing all actions...
    # Run through all commands if the choice is "All the above"
    for i in {0..2}; do
      run_command $i 0
      if [ $? -ne 0 ]; then
        break
      fi
    done
  elif [ $choice = 4 ]; then
    # Exit the program

    delete_lines 20
    unset ASNMSCMD

    echo Bye Bye...
    exit 0
  else
    # Run the correct command according to the choice
    run_command $choice 1
  fi

  unset ASNMSCMD

  RETURN_CODE=$?
  if [ $RETURN_CODE -ne 0 ]; then
    echo "🔴 Something went wrong while executing: '${options[$choice]}'"
    exit $RETURN_CODE
  fi

}

execute