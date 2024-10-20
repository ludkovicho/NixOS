{
  fileSystems."/drives/ssd/1" = {
    device = "/dev/disk/by-uuid/3e25cd23-511c-47d2-82a5-4eef72961b87";
    fsType = "ext4";
    options = [
      "x-gvfs-show"
      "noatime"
      "nofail"
      "async"
      "user"
      "suid"
      "exec"
      "auto"
      "dev"
      "rw"
    ];
  };
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/89c454c8-3699-40c8-a44c-e43240bfb902";
    fsType = "ext4";
    label = "root";
    options = [
      "x-gvfs-show"
    ];
  };
  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/49963f6b-e68c-46f3-8afe-0e28fd89034b";
    fsType = "ext4";
    label = "nix";
    neededForBoot = true;
    options = [
      "x-gvfs-show"
    ];
  };
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/fe466a30-e2cf-4445-869f-3bb45ea82f2d";
    fsType = "ext4";
    label = "home";
    options = [
      "x-gvfs-show"
      "noatime"
      "nofail"
      "async"
      "user"
      "suid"
      "exec"
      "auto"
      "dev"
      "rw"
    ];
  };
  systemd.services.set-ssd1-permissions = {
    description = "Permissions";
    after = [ "local-fs.target" ];
    requires = [ "local-fs.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "/bin/sh -c 'chown -R varmisanth:users /drives/ssd/1 && chmod -R 777 /drives/ssd/1'";
    };  
    wantedBy = [ "multi-user.target" ];
  };
}
