{ lib
, pkgs
, config
, modulesPath
, ... 
}:
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/89c454c8-3699-40c8-a44c-e43240bfb902";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/fe466a30-e2cf-4445-869f-3bb45ea82f2d";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/1867-8AD4";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  swapDevices = [ ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
