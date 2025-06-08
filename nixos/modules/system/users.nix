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
        # Misc
        vlc # Good old VLC
        spotify # (patched with SpotX through an overlay)
        # godot_4 # Godot engine
        yaak # Rest API client
        easyeffects # Audio effects
        # devilutionx # Diablo on steroids BUG: does not build atm
        jetbrains.jdk # OpenJDK does not ship JavaFX for Minecraft
        mcrcon # RCON server for Minecraft servers
      ];
    };
  };
}
