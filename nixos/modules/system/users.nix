{
  pkgs,
  inputs,
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
        jq
        pciutils # lspci
        inputs.norgolith.packages.x86_64-linux.default
        hyperfine
        wl-clipboard
        nicotine-plus # SoulSeek ftw
        cloudflare-warp # Goodbye P2P torrent restrictions from my ISP!
        qbittorrent
        pavucontrol
        mission-center
        # Sneak Peak
        svp
        ffmpeg
        inkscape
        obs-studio
        cameractrls
        # Social
        vesktop # Discord
        element-desktop # Matrix
        telegram-desktop # Telegram
        signal-desktop
        # Multimedia
        vlc # Good old VLC
        cava # Terminal audio visualizer
        rmpc # Terminal music player
        spotify # (patched with SpotX through an overlay)
        easyeffects # Audio effects
        # Misc
        yaak # Rest API client
        newsflash # Modern feed reader (GTK4)
        # devilutionx # Diablo on steroids BUG: does not build atm
        jetbrains.jdk # OpenJDK does not ship JavaFX for Minecraft
        mcrcon # RCON server for Minecraft servers
      ];
    };
  };
}
