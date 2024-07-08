#!/usr/bin/env bash

choice=89
is_interactive=0
verbose=1

while getopts ":adecx" OPTION; do
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
    verbose=0;;
  *)
    choice=89;;
  esac

done
