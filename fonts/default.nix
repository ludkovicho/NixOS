{ pkgs
, ...
}:
{
  fonts = {
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = true;
    };
    packages = with pkgs; [ 
      nerdfonts
      (google-fonts.override { fonts = [ "Josefin Sans" "Jost" ]; })
      liberation-sans-narrow
      helvetica-neue-lt-std
      noto-fonts-cjk-serif
      noto-fonts-cjk-sans
      noto-fonts-lgc-plus
      liberation_ttf_v1
      noto-fonts-emoji
      cantarell-fonts
      source-sans-pro
      liberation_ttf
      dejavu_fonts
      source-sans
      montserrat
      open-fonts
      noto-fonts
      comfortaa
      overpass 
    ];
  };
}
