{
  description = "Goofy ahhh system configuration";

  # Binary cache to improve the build time of playit
  nixConfig = {
    extra-substituters = [ "https://playit-nixos-module.cachix.org" ];
    extra-trusted-public-keys = [ "playit-nixos-module.cachix.org-1:22hBXWXBbd/7o1cOnh+p0hpFUVk9lPdRLX3p5YSfRz4=" ];
  };

  inputs = {
    # Nixpkgs unstable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

    # Ghostty terminal emulator
    ghostty = {
      url = "git+ssh://git@github.com/ghostty-org/ghostty";
      # Temporary fix for gobject issue
      inputs.nixpkgs-unstable.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    # Playit.gg agent
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";
  };

  outputs = {
    nixpkgs,
    nix-flatpak,
    ghostty,
    playit-nixos-module,
    ...
  } @ inputs: {
    nixosConfigurations.tundra = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        playit-nixos-module.nixosModules.default
        ./nixos/configuration.nix
      ];
    };
  };
}
