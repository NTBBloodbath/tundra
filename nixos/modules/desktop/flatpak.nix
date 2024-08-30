{
  # Enable flatpak
  services.flatpak.enable = true;

  # Automatically update flatpak applications weekly
  services.flatpak.update.auto.enable = true;
  # Automatically uninstall unmanaged flatpak applications
  # i.e. if packages were installed via flatpak directly
  services.flatpak.uninstallUnmanaged = true;

  # Flatpak applications
  services.flatpak.packages = [
    "im.riot.Riot" # Element
    "com.obsproject.Studio" # OBS
    "com.spotify.Client" # Spotify
    "com.github.tchx84.Flatseal" # Manage flatpak permissions
    "io.freetubeapp.FreeTube" # The private youtube client
    "com.orama_interactive.Pixelorama" # Pixel art editor
    # "org.freedesktop.Platform.VulkanLayer.MangoHud/x86_64/23.08" # MangoHud for Bottles
    "io.github.Foldex.AdwSteamGtk" # Steam <3 Adwaita
    "org.videolan.VLC" # Good old VLC
    "org.telegram.desktop" # Telegram
  ];
}
