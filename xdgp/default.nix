{ config
, inputs
, pkgs
, lib
, ... 
}:
{
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = "*";
      };
    };
    extraPortals = [
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = lib.mkDefault [
      inputs.hyprland.packages.${pkgs.system}.hyprland
    ];
  };
}
