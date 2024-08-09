# Tundra

A wise man once said "never say never", but the fool didn't understand and went on his way.
Later, the fool discovered his enormous masochism and tripped on the stone he always said he would
never trip on. And that's how I ended up becoming a NixOS user.

> [!NOTE]
> The name of my dotfiles comes from the [Minecraft Tundra biome](https://minecraft.wiki/w/Tundra).

---

For the time being, I continue to configure my software in the traditional way. Those configurations
reside in the `etc` directory, and my NixOS configuration resides in the `nixos` directory.
The `share` directory is self-explanatory.

## Installation

Pre-requisites:
- [NixOS](https://nixos.org/manual/nixos/stable/index.html#ch-installation) installed.
- [Flakes enabled](https://nixos.wiki/wiki/flakes).

Clone the repository and `cd` into it:
```sh
git clone https://github.com/NTBBloodbath/tundra.git && cd tundra
```

First, create a hardware configuration for your system:
```sh
sudo nixos-generate-config
```

After you have created a `/etc/nixos/hardware-configuration.nix` file, build the configuration with:
```sh
sudo nixos-rebuild switch --flake .
```

Once everything is ready, move the contents of the `etc` directory to `~/.config` and the `share`
directory to `~/.local/share`. And that's it :)

## License

My dotfiles are licensed under the ~cuck~ MIT license. Feel free to take inspiration or take parts
from them.
