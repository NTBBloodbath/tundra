{ lib, ... }:

{
  imports = [
    ./fstrim.nix
    ./sound.nix
    ./printers.nix
  ];

  fstrim.enable = lib.mkDefault true;
  sounds.enable = lib.mkDefault true;
}
