{
  config,
  lib,
  pkgs,
  ...
}: {
  # Install Firefox Developer Edition
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;
  };

  environment.systemPackages = with pkgs; [
    lact # AMDGPU Controller
    bottles # Wine gaming my beloved
  ];
}
