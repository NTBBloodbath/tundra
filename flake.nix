{
  description = "Goofy ahhh system configuration";

  inputs = {
    # Nixpkgs unstable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

    # Lix my beloved
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Ghostty terminal emulator
    ghostty = {
      url = "git+ssh://git@github.com/ghostty-org/ghostty";
      # Temporary fix for gobject issue
      inputs.nixpkgs-unstable.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nix-flatpak,
    lix-module,
    ghostty,
    ...
  } @ inputs: {
    nixosConfigurations.tundra = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        lix-module.nixosModules.default
        nix-flatpak.nixosModules.nix-flatpak
        ./nixos/configuration.nix
      ];
    };
  };
}
