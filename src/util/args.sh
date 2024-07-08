#!/usr/bin/env bash

choice=89
is_interactive=0

while getopts ":adec" OPTION; do
  case $OPTION in
  d)
    choice=0;;
  e)
    choice=1;;
  c)
    choice=2;;
  a)
    choice=3
    ;;
  *)
    choice=89;;
  esac
done
