{ pkgs
, ...
}:
{
  services = {
    dunst = {
      enable = true;
      settings = {
        global = {
          stack_duplicates = false;
          icon_corner_radius = 2;
          corner_radius = 2;
          frame_width = 2;
          gap_size = 10;
          height = 150;
          width = 450;
          origin = "top-right";
          offset = "15x35";
          font = "Jost 9";
          background = "#24283B";
          frame_color = "#8fa4da";          
        };
      };
      iconTheme = {
        name = "TokyoNight-SE";
        package = import ../../themes/icons/tokyo-night/default.nix {
          inherit (pkgs) fetchurl lib pkgs stdenv jdupes gtk3 hicolor-icon-theme gnome-icon-theme breeze-icons autoreconfHook pkg-config gdk-pixbuf librsvg gnome gnome3;
        };
        size = "32x32";
      }; 
    };
  };
}
