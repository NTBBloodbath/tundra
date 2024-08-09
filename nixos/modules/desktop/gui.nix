{ config, lib, pkgs, ... }:

{
  options = {
    gui.enable = lib.mkEnableOption "enable GUI packages";
  };

  config = lib.mkIf config.gui.enable {
    # Install Firefox Developer Edition
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition-bin;
    };
  };
}
