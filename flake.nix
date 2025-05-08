{
  description = "Goofy ahhh system configuration";

  # Binary cache to improve the build time of playit
  nixConfig = {
    extra-substituters = [ "https://playit-nixos-module.cachix.org" ];
    extra-trusted-public-keys = [ "playit-nixos-module.cachix.org-1:22hBXWXBbd/7o1cOnh+p0hpFUVk9lPdRLX3p5YSfRz4=" ];
  };

  inputs = {
    # Nixpkgs unstable
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable&shallow=1";

    # Cry about it Blackmagic, I'm not paying for studio.
    nixpkgs-929116.url = "github:nixos/nixpkgs/929116e316068c7318c54eb4d827f7d9756d5e9c?shallow=1";

    # Playit.gg agent
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module?shallow=1";

    # Neovim nightly
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay?shallow=1";

    # Zen browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake?shallow=1";

    # Norgolith
    norgolith.url = "github:NTBBloodbath/norgolith?shallow=1";

    # SpotX-Bash overlay
    oskars-dotfiles = {
      url = "github:oskardotglobal/.dotfiles/nix?shallow=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixpkgs-929116,
    neovim-nightly-overlay,
    playit-nixos-module,
    zen-browser,
    norgolith,
    oskars-dotfiles,
    ...
  } @ inputs:
  let
    pkgs-davinci = import nixpkgs-929116 {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations.tundra = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs pkgs-davinci;};
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
