if [[ $EUID -eq 0 ]]; then
  log ERROR "Do not run this script as root or with sudo."
  exit 1
fi

available=(niri umbriel)

compositors=("$@")
((${#compositors[@]})) || compositors=("${available[@]}")
for c in "${compositors[@]}"; do
  if [[ " ${available[*]} " != *" $c "* ]]; then
    log ERROR "Unknown compositor: $c (choose from: ${available[*]})"
    exit 1
  fi
done
