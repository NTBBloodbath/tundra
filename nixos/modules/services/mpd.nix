{
  config,
  lib,
  pkgs,
  ...
}: {
  services.mpd = {
    enable = true;
    startWhenNeeded = true;

    user = "amartin";

    musicDirectory = "/mnt/Storage/Music";
    # network.listenAddress = "any";

    extraConfig = ''
      audio_output {
        type   "fifo"
        name   "mpd_fifo"
        path   "/tmp/mpd.fifo"
        format "44100:16:2"
      }

      audio_output {
        type "pipewire"
        name "Pipewire Output"
      }
    '';
  };

  # See https://wiki.nixos.org/wiki/MPD PipeWire workaround section
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

  environment.systemPackages = with pkgs; [
    beets
    beetsPackages.copyartifacts # Copy non-music files during import
    # So that tools like Playerctl are able to interact with MPD
    mpdris2 # MPRIS 2 support for mpd
  ];
}
