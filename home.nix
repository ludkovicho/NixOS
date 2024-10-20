{ config
, inputs
, pkgs
, ...
}:
{
  home-manager = {
    users.varmisanth = {
      home.packages = with pkgs; [
        telegram-desktop
        qbittorrent
        vesktop
        nemo
        gamescope
        gamemode
        bottles
        wl-screenrec
        wl-clipboard
        hyprpicker
        cliphist
        slurp
        grim
        walk
        libsForQt5.qtstyleplugin-kvantum
        libsForQt5.lightly
        qt6.qtwayland
        qt5.qtwayland
        xdg-user-dirs
        xdg-utils
        hyprpaper
        woeusb
        ntfs3g
        unrar
        unzip
        p7zip
        imv
        dconf       
        pavucontrol
        pulseaudio
        playerctl
        blueman
        nix-prefetch-github
        appimage-run
        git
        tree
        ncdu
        jq
        alacritty
        alacritty-theme
        inputs.firefox-nightly.packages.${pkgs.system}.firefox-nightly-bin
        inputs.eww.packages.${pkgs.system}.eww
        (pkgs.callPackage ./gui/themes/bash/default.nix {
          inherit (pkgs) lib stdenv fetchFromGitHub writeShellScriptBin bash;
        })
      ];
    };
  };
}
