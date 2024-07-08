#!/usr/bin/env bash

print_title() {
    echo "
+-------------------------------------------------------------------------+
|            _ _    _____       _             _     _   _ __  __  _____   |
|      /\   | | |  / ____|     (_)           | |   | \ | |  \/  |/ ____|  |
|     /  \  | | | | (___  _ __  _  __ _  ___ | |_  |  \| | \  / | (___    |
|    / /\ \ | | |  \___ \| '_ \| |/ _\` |/ _ \| __| | . \` | |\/| |\___ \   |
|   / ____ \| | |  ____) | |_) | | (_| | (_) | |_  | |\  | |  | |____) |  |
|  /_/    \_\_|_| |_____/| .__/|_|\__, |\___/ \__| |_| \_|_|  |_|_____/   |
|                        | |       __/ |                                  |
|                        |_|      |___/                                   |
|                                                                         |
|                           Created by: Jacxk                             |
|             Github: https://github.com/Jacxk/all-spigot-nms             |
|                                                                         |
|                      Report any issues on Github.                       |
|                                                                         |
+-------------------------------------------------------------------------+
"
}

# Check which OS is the command running on
check_os() {
  OS=$(uname)
  echo Detected OS: $OS.

  # Check if the user is running inside a shell terminal
  if [ $? -ne 0 ]; then
    echo It looks like you\'re running the script outside a shell
    exit 1
  fi

  export_cmd() {
    # Check the current OS to set the correct path to `jar`
    if [[ $OS == Linux* ]] || [[ $OS == Darwin* ]]; then
      export ASNMSCMD="$java_home\bin\jar"
    else
      export ASNMSCMD="$java_home\bin\jar.exe"
    fi
  }

  # Check if the jar command is available
  if ! jar --version > /dev/null; then
    java_home="$(printenv JAVA_HOME)"

    # Check if the $JAVA_HOME variable is set
    if [ -z "$java_home" ]; then
      # If not set, check the $PATH and see if it's added
      if [[ $PATH == *'jdk/bin'* ]]; then
        echo Could not find the JDK on \$JAVA_HOME or in \$PATH
        exit 1
      fi

      export_cmd
    fi
  fi
  # Use `jar` if the JDK is in $PATH
  export ASNMSCMD=jar

  echo "Using '$ASNMSCMD' for compilation"
}

check_internet_connection() {
  curl -sI http://google.com > /dev/null
  if [[ $? -ne 0 ]]; then
    echo There\'s no internet connection to download the Jar files
    exit 1
  fi
}

delete_lines() {
  if [ $verbose -eq 1 ]; then
    local range="$1"
    for ((i = 1; i <= range; i++)); do
        moveCursorUp
        deleteLine
    done
  fi
}

echo_verbose() {
  if [ $verbose -eq 1 ]; then
    echo $@
  fi
}