{ lib, ... }:

{
  imports = [
    ./term.nix
    ./gui.nix
    ./games.nix
    ./flatpak.nix
    ./libinput.nix
    ./sessions.nix
  ];

  term.enable = lib.mkDefault true;
  gui.enable = lib.mkDefault true;
  games.enable = lib.mkDefault true;
  flatpak.enable = lib.mkDefault true;
  libinput.enable = lib.mkDefault false;
  sessions.enable = lib.mkDefault true;
}
