{
  pkgs,
  ...
}: {
  services.xserver = {
    # Enable the X11 windowing system
    enable = true;
    videoDrivers = ["amdgpu"];

    # Configure keymap in X11
    xkb = {
      layout = "latam";
      variant = "";
    };

    # Disable XTerm
    desktopManager.xterm.enable = false;
  };

  # Enable the GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Exclude certain packages from GNOME
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour # GNOME guide
    epiphany # web browser
    geary # email reader
  ];

  # Niri, scrollable-tiling Wayland compositor
  programs.niri.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    # --- GNOME additional packages
    refine # Modern gnome-tweaks replacement
    # --- GNOME Extensions
    gnomeExtensions.freon # Monitor temps, voltage and fan RPM
    gnomeExtensions.forge # Tiling window manager
    gnomeExtensions.caffeine # Do not sleep
    gnomeExtensions.appindicator # Tray icons
    gnomeExtensions.blur-my-shell # Add blur effect
    gnomeExtensions.removable-drive-menu # Mount/Unmount removable devices
    gnomeExtensions.dash-to-dock # Convert the dash into a macOS style dock
    gnomeExtensions.gamemode-shell-extension # gamemode indicator
    gnomeExtensions.quick-settings-audio-panel # audio panel
  ] ++ [
    # --- Niri
    xwayland-satellite # Xwayland
    waybar # Statusbar
    quickshell # QuickShell go brr
    mpvpaper # Animated wallpapers from MP4
    rofi-wayland # App launcher
    playerctl # Control audio
    swaybg # Wallpaper
    swaynotificationcenter # Notification daemon and center
    wlogout # Logout menu
    wlsunset # Eye protection
    swayosd # GNOME-like OSD
  ];

  # Enable gnome-settings-daemon udev rules to make sure tray works well
  services.udev.packages = [pkgs.gnome-settings-daemon];

  # Automatically login to GNOME session
  services.displayManager = {
    defaultSession = "niri";
    autoLogin.user = "amartin";
  };

  # Make Electron applications use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
