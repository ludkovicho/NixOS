{ pkgs ? import <nixpkgs> {} }:
pkgs.writeShellScriptBin "wayshot" ''
#!/run/current-system/sw/bin/bash
SCREENSHOT_PATH=/home/varmisanth/Pictures/Screenshots
TIMESTAMP=$(date +%Y%m%d%H%M%S)
FULL_PATH="$SCREENSHOT_PATH/SCREENSHOT$TIMESTAMP.png"
grim -g "$(slurp -s '7ebae400' -c 'ffffffff' -b '40404040' -w '1')" "$FULL_PATH"
wl-copy --type image/png < "$FULL_PATH"
dunstify -i "Screenshot Taken" "Screenshot saved at: $FULL_PATH"
''

