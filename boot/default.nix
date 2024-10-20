{
  boot.loader = {
    systemd-boot = {
      enable = true;
    };
  };
  boot.supportedFilesystems = [ "ntfs" ];
}
