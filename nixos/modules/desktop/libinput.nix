{ config, lib, pkgs, ... }:

{
  options = {
    libinput.enable = lib.mkEnableOption "enable touchpad";
  };

  config = lib.mkIf config.libinput.enable {
    # Enable touchpad support (enabled default in most desktopManager)
    # services.xserver.libinput.enable = true;
  };
}
