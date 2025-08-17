{
  config,
  lib,
  pkgs,
  ...
}: {
  services.mpd = {
    enable = true;
    startWhenNeeded = true;

    musicDirectory = "/mnt/Storage/Music";
    # network.listenAddress = "any";
  };
}
