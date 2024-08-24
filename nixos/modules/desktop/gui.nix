{
  pkgs,
  ...
}: {
  # Install Firefox Developer Edition
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;
  };

  environment.systemPackages = with pkgs; [
    lact # AMDGPU Controller
    # Office
    libreoffice
    hunspell
    hunspellDicts.es_VE
    hunspellDicts.en-gb-ize
    # GNOME
    loupe # Image viewer
    evince # Document viewer
    baobab # Analyze disk usage
    # snapshot # Camera
    seahorse # Manage keyring
    nautilus # File manager
    gnome-calculator # Calculator
    gnome-disk-utility # Udisks GUI
    gnome-text-editor # Text editor
    gnome.gnome-logs # SystemD journal logs
  ];

  # NOTE: see https://github.com/NixOS/nixpkgs/issues/317544
  systemd.services.lactd = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
      Nice = -10;
    };
    enable = true;
  };
}
