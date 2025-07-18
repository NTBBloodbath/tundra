{
  pkgs,
  inputs,
  ...
}: {
  # Install Firefox Developer Edition
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
  };

  environment.systemPackages = with pkgs; [
    # Browsers
    inputs.zen-browser.packages."${system}".default
    nyxt
    # Utilities
    lact # AMDGPU Controller
    gapless # GTK4 music player
    ente-desktop # Lovely Ente client
    # Office
    libreoffice
    hunspell
    hunspellDicts.es_VE
    hunspellDicts.en-gb-ize
    # VSCode with FHS support, I don't need to declaratively install my extensions.
    vscode.fhs
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
