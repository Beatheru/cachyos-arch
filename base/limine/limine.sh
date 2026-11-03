
ESP=$(bootctl --print-esp-path)
conf="$ESP/limine.conf"

splash=$(sudo sed -nE 's|^[[:space:]]*wallpaper:[[:space:]]*boot\(\):/(.+)$|\1|p' "$conf" | head -1)

tmp=$(mktemp)
sudo awk '
  /^[[:space:]]*\// { entries = 1 }
  !entries && /^[[:space:]]*(term_|wallpaper|backdrop|#)/ { next }
  { print }
' "$conf" | cat theme.conf - >"$tmp"

# Write next to the original and rename over it, like limine-entry-tool does,
# so an interrupted write can't leave a half-written boot menu
sudo install -m600 "$tmp" "$conf.tmp"
sync -f "$conf.tmp"
sudo mv "$conf.tmp" "$conf"
rm "$tmp"

[[ -n $splash ]] && sudo rm -f "$ESP/$splash"
exit 0
