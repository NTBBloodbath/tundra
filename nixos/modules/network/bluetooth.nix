{ config, lib, pkgs, ... }:

{
  options = {
    bluetooth.enable = lib.mkEnableOption "enable bluetooth";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    # If your DE does not provide a GUI for pairing bluetooth devices
    # you can additionally enable the blueman service, which provides
    # blueman-applet and blueman-manager
    # services.blueman.enable = true;
  };
}
