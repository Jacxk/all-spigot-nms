#!/usr/bin/env bash

choice=89
is_interactive=0
display_title=1
verbose=1

while getopts ":adecxtk" OPTION; do
  case $OPTION in
  d)
    choice=0;;
  e)
    choice=1;;
  c)
    choice=2;;
  a)
    choice=3;;
  x)
    verbose=0
    echo Verbose is off.
    ;;
  t)
    choice=77;;
  k)
    display_title=0;;
  *)
    choice=89;;
  esac

done
