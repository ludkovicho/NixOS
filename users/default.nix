{ pkgs 
, ... 
}: 
{
  users.users.varmisanth = {
    isNormalUser = true;
    description = "varmisanth";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    packages = with pkgs; [ ];
  };
}
