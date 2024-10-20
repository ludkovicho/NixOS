let
  tokyo_night.Theme = "/nix/store/migv7bglix7ljp3q2iphj0nq16k7864v-alacritty-theme-0-unstable-2024-05-03/tokyo-night.toml";
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      import = [ tokyo_night.Theme ];
      font = {
        size = 11.0;
        normal = {
          family = "MesloLGS Nerd Font";
          style = "Regular";
        };       
        bold = {
          family = "MesloLGS Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "MesloLGS Nerd Font";
          style = "Italic";
        };        
        bold_italic = {
          family = "MesloLGS Nerd Font";
          style = "Bold Italic";
        };
      };
    };
  };
}
