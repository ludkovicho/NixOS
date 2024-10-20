{ pkgs
, ...
}:
{
  hardware = {
    pulseaudio = {
      enable = false;
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      package = pkgs.bluez;
      settings = {
        General = {
          Experimental = true;
        };
      };
    };
  };
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber = {
        enable = true;
      };
    };
  };
  security = {
    rtkit.enable = true;
  };
}
