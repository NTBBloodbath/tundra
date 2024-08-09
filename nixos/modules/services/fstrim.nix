{ config, lib, pkgs, ... }:

{
  options = {
    fstrim.enable = lib.mkEnableOption "enable SSD TRIM";
  };

  config = lib.mkIf config.fstrim.enable {
    services.fstrim = {
      enable = true;
      interval = "weekly";
    };
  };
}
