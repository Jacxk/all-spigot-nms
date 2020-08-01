check() {
  FILE=../../all-spigot-nms.jar

  if test -f "$FILE"; then
    exit 0
  else
    exit 1
  fi
}
