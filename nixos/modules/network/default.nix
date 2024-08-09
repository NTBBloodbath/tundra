{ lib, ... }:

{
  imports = [
    ./net.nix
    ./ssh.nix
    ./locale.nix
    ./bluetooth.nix
  ];

  ssh.enable = lib.mkDefault true;
  bluetooth.enable = lib.mkDefault true;
}
