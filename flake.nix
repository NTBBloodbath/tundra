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

    # Playit.gg agent
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # SpotX-Bash overlay
    oskars-dotfiles = {
      url = "github:oskardotglobal/.dotfiles/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    neovim-nightly-overlay,
    playit-nixos-module,
    oskars-dotfiles,
    ...
  } @ inputs: {
    nixosConfigurations.tundra = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        playit-nixos-module.nixosModules.default
        ./nixos/configuration.nix
        # Spotify patched with SpotX-Bash
        ({pkgs, ...}: {
          nixpkgs.overlays = [oskars-dotfiles.overlays.spotx];
        })
      ];
    };
  };
}
