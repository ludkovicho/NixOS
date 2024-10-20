{
  description = "My first experience with Nix Flakes";
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    firefox-nightly.url = "github:colemickens/flake-firefox-nightly";
    catppuccin.url = "github:catppuccin/nix";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    eww.url = "github:elkowar/eww";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };
  outputs = { self, nixpkgs, home-manager, catppuccin, hyprland, eww, chaotic, ... } @inputs: {
    nixosConfigurations = {
      varmisanth = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          inputs.home-manager.nixosModules.home-manager
          ./hardware-configuration.nix
          ./configuration.nix
          ./system-pkgs/default.nix
          ./systemd-polkit/default.nix
          ./drives/default.nix
          ./boot/default.nix
          ./users/default.nix
          ./security/default.nix
          ./pipewire/default.nix
          ./opengl/default.nix
          ./mesa/default.nix
          ./gvfs/default.nix
          ./xdg-user-dirs/default.nix
          ./i18n/default.nix
          ./time/default.nix
          ./networking/default.nix
          ./fonts/default.nix
          ./env/default.nix
          ./xdgp/default.nix
          ./nix-config/default.nix
          ./nixpkgs-config/default.nix
          ./steam/default.nix
          ./home.nix
          chaotic.nixosModules.default
          ({ config, lib, pkgs, ... }: {
            home-manager = {
              useUserPackages = true;
              useGlobalPkgs = true;
              backupFileExtension = "backup";
              users.varmisanth = {
                home.packages = with pkgs; [ ];
                imports = [
                  (import ./gui/wm/hyprland/default.nix { config = config; lib = lib; pkgs = pkgs; inputs = inputs; })
                  ./gui/wm/hyprpaper/default.nix
                  ./gui/wm/waybar/default.nix
                  ./gui/wm/dunst/default.nix
                  ./gui/rice/default.nix
                  ./gui/themes/terminals/alacritty/default.nix
                  catppuccin.homeManagerModules.catppuccin
                ];
                home.stateVersion = "24.05";
                home.username = "varmisanth";
                home.homeDirectory = "/home/varmisanth";
              };
            };
          })
        ];
      };
      overlays = [ inputs.eww.overlay ];
    };
  };
}
