{
  config,
  lib,
  pkgs,
  ...
}: {
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # If your DE does not provide a GUI for pairing bluetooth devices
  # you can additionally enable the blueman service, which provides
  # blueman-applet and blueman-manager
  # services.blueman.enable = true;
}
