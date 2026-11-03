sudo pacman -Syu --noconfirm --needed yay
yay -Y --save --sudoloop --cleanafter --batchinstall

mapfile -t packages < <(sed 's/#.*//' "$INSTALL_HOME/base/packages.list" | xargs -n1)

yay -S --noconfirm --needed --answerclean None --answerdiff None --answeredit None "${packages[@]}"

# Some packages are already on the system as dependencies of CachyOS packages.
# Mark as explicit so they stay if those packages are ever removed.
sudo pacman -D --asexplicit "${packages[@]}" >/dev/null
