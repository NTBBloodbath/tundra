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
