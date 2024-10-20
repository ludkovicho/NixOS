#!/run/current-system/sw/bin/bash
dunst_notify() {
  dunstify -i "System Cleanup" "$1" -u normal -t 5000
}
dunst_notify "Starting NixOS rebuild..."
sudo nixos-rebuild switch
if [ $? -eq 0 ]; then
  dunst_notify "NixOS rebuild completed successfully!"
else
  dunst_notify "NixOS rebuild failed!"
  exit 1
fi
dunst_notify "Starting NixOS boot rebuild..."
sudo nixos-rebuild boot
if [ $? -eq 0 ]; then
  dunst_notify "NixOS boot rebuild completed successfully!"
else
  dunst_notify "NixOS boot rebuild failed!"
  exit 1
fi
dunst_notify "Starting system cleanup..."
nix-collect-garbage && nix-collect-garbage -d && nix-store --optimise
if [ $? -eq 0 ]; then
  dunst_notify "System cleanup completed!"
else
  dunst_notify "System cleanup failed!"
fi
