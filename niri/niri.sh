yay -S --noconfirm --needed --answerclean None --answerdiff None --answeredit None niri xdg-desktop-portal-gnome xwayland-satellite

mkdir -p ~/.config/niri
cp -rT config ~/.config/niri

# See https://yalter.github.io/niri/Nvidia
sudo mkdir -p /etc/nvidia/nvidia-application-profiles-rc.d
sudo cp niri.json /etc/nvidia/nvidia-application-profiles-rc.d/niri.json
