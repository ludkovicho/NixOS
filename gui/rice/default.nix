{ config
, pkgs
, lib
, ...
}:
let
  qtctConfig = import ../themes/qtct/default.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "macchiato";
      accent = "blue";
      size = "standard";
      tweaks = [ "normal" ];
    };
    font = {
      name = "Jost";
      size = 11;
    };
    iconTheme = {
      name = "TokyoNight-SE";
      package = import ../../gui/themes/icons/tokyo-night/default.nix {
        inherit (pkgs) fetchurl lib pkgs stdenv jdupes autoreconfHook pkg-config gdk-pixbuf librsvg gnome3 gnome gtk3 hicolor-icon-theme gnome-icon-theme breeze-icons;
      };
    };
  };
  qt = {
    enable = true;
    platformTheme = {
      name = "qtct";
    };
    style = {
      name = "kvantum";
    };
  };
  home = {
    packages = with pkgs; [
      (pkgs.catppuccin.override {
        accent = "blue";
        variant = "macchiato";
      })
    ];
    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
  xdg.configFile = {
    "Kvantum/Catppuccin-Macchiato-Blue/Catppuccin-Macchiato-Blue.kvconfig".source = "${pkgs.catppuccin}/share/Kvantum/Catppuccin-Macchiato-Blue/Catppuccin-Macchiato-Blue.kvconfig";
    "Kvantum/Catppuccin-Macchiato-Blue/Catppuccin-Macchiato-Blue.svg".source = "${pkgs.catppuccin}/share/Kvantum/Catppuccin-Macchiato-Blue/Catppuccin-Macchiato-Blue.svg";
  };
  xdg.configFile = {
    "qt5ct/colors/Catppuccin-Macchiato.conf".source = qtctConfig.themePath;
    "qt6ct/colors/Catppuccin-Macchiato.conf".source = qtctConfig.themePath;
  };
}
