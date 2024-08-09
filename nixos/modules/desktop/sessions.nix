{ config, lib, pkgs, ... }:

{
  options = {
    sessions.enable = lib.mkEnableOption "enable sessions";
  };

  config = lib.mkIf config.sessions.enable {
    services.xserver = {
      # Enable the X11 windowing system
      enable = true;
      videoDrivers = [ "amdgpu" ];

      # Configure keymap in X11
      xkb = {
        layout = "latam";
        variant = "";
      };

      # Enable the GNOME Desktop Environment
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      # Disable XTerm
      desktopManager.xterm.enable = false;
    };

    # Exclude certain packages from GNOME
    environment.gnome.excludePackages = (with pkgs; [
      gnome-tour # GNOME guide
      epiphany  # web browser
      geary      # email reader
    ]);
  };
}
