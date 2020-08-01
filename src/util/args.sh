#!/usr/bin/env bash

choice=89

while getopts ":adec" OPTION; do
  case $OPTION in
  d)
    choice=0
    break
    ;;
  e)
    choice=1
    break
    ;;
  c)
    choice=2
    break
    ;;
  a)
    choice=3
    break
    ;;
  *)
    choice=89
    break
    ;;
  esac
done
