{
  pkgs,
  ...
}: {
  users.users = {
    amartin = {
      isNormalUser = true;
      description = "Alejandro Martin";
      extraGroups = ["networkmanager" "wheel" "adbusers" "input"];
      openssh.authorizedKeys.keys = [
        # TODO: Add my SSH public key here
      ];
      packages = with pkgs; [
        # Terminal emulators
        kitty # required to get the kitten utility to display images on Ghostty
        ghostty
        # Development tools
        cachix
        devenv
        jujutsu
        penpot-desktop
        # Utilities
        hyperfine
        wl-clipboard
        nicotine-plus # SoulSeek ftw
        cloudflare-warp # Goodbye P2P torrent restrictions from my ISP!
        qbittorrent
        pavucontrol
        # Social
        vesktop # Discord
        element-desktop # Matrix
        telegram-desktop # Telegram
        # Misc
        vlc # Good old VLC
        spotify # (patched with SpotX through an overlay)
        # godot_4 # Godot engine
        insomnia # Rest API client
        inkscape
        obs-studio
        cameractrls
        showmethekey # Wayland keylogger
        easyeffects # Audio effects
        devilutionx # Diablo on steroids
        jetbrains.jdk # OpenJDK does not ship JavaFX for Minecraft
        mcrcon # RCON server for Minecraft servers
      ];
    };
  };
}
