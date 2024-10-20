{ pkgs
, ... 
}:
{
  systemd.user.services.createXdgDirs = {
    description = "Create XDG standard directories if they don't exist";
    serviceConfig = {
      ExecStart = "${pkgs.xdg-user-dirs}/bin/xdg-user-dirs-update";
    };
    wantedBy = [ "default.target" ];
  };
}
