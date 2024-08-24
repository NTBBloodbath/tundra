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

    # Enable the GNOME Desktop Environment
    displayManager.gdm.enable = true;
    # desktopManager.gnome.enable = true;

    # Disable XTerm
    desktopManager.xterm.enable = false;
  };

  # Hyprland, testing new stuff is great _sometimes_
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    # --- Hyprland add-ons
    hypridle # Idle daemon
    hyprnome # GNOME-like workspace switching
    hyprshot # Wrapper around grim + slurp for convenience
    hyprpicker # Wayland color picker, required for hyprshot's --freeze
    hyprland-protocols # Wayland protocol extensions
    waybar # Statusbar
    mpvpaper # Animated wallpapers from MP4
    rofi-wayland # App launcher
    playerctl # Control audio
    swaynotificationcenter # Notification daemon and center
    wlogout # Logout menu
    # swayosd # GNOME-like OSD
    # --- Hyprland plugins
    # See https://github.com/KZDKM/Hyprspace/issues/79
    # hyprlandPlugins.hyprspace
  ];

  services.displayManager = {
    defaultSession = "hyprland";
    autoLogin.user = "amartin";
  };
}
