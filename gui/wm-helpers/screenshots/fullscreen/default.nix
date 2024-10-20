{ pkgs ? import <nixpkgs> {} }:
pkgs.writeShellScriptBin "hyprshot" ''
#!/run/current-system/sw/bin/bash
SCREENSHOT_PATH=/home/varmisanth/Pictures/Screenshots
TIMESTAMP=$(date +%Y%m%d%H%M%S)
FULL_PATH="$SCREENSHOT_PATH/SCREENSHOT$TIMESTAMP.png"
grim "$FULL_PATH"
wl-copy --type image/png < "$FULL_PATH"
dunstify -i "Screenshot Taken" "Screenshot saved at: $FULL_PATH"
''
