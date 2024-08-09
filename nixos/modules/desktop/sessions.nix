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
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour # GNOME guide
      epiphany   # web browser
      geary      # email reader
    ];

    # GNOME Extensions
    environment.systemPackages = with pkgs.gnomeExtensions; [
      freon                # Monitor temps, voltage and fan RPM
      forge                # Tiling window manager
      caffeine             # Do not sleep
      appindicator         # Tray icons
      blur-my-shell        # Add blur effect
      removable-drive-menu # Mount/Unmount removable devices
      dash-to-dock         # Convert the dash into a macOS style dock
    ];

    # Enable gnome-settings-daemon udev rules to make sure tray works well
    services.udev.packages = [ pkgs.gnome.gnome-settings-daemon ];
  };
}
