{
  security = {
    polkit.enable = true;
    sudo = {
      extraRules = [
        {
          users = [ "varmisanth" ];
          commands = [
            {
              command = "/run/current-system/sw/bin/nixos-rebuild switch";
              options = [ "NOPASSWD" ];
            }
            {
              command = "/run/current-system/sw/bin/nixos-rebuild boot";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];
    };
  };
}

