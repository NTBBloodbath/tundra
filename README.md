# Tundra

A wise man once said "never say never", but the fool didn't understand and went on his way.
Later, the fool discovered his enormous masochism by tripping over the stone he always said he would
never trip over. And that's how I ended up becoming a NixOS user.

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

After you have created a `/etc/nixos/hardware-configuration.nix` file, copy it to the repository and
then proceed to build the configuration with:
```sh
# Change workstation to whatever you want if you are using my setup
# if you do, remember to also modify the module import path in the flake.nix
cp /etc/nixos/hardware-configuration.nix ./hosts/workstation/

sudo nixos-rebuild switch --flake .
```

Once everything is ready, move the contents of the `etc` directory to `~/.config` and the `share`
directory to `~/.local/share`. And that's it :)

## Showcase

<details>
<summary>Desktop view</summary>

![desktop](https://github.com/user-attachments/assets/9617013a-9223-4af8-8325-523d808d89e0)

</details>

<details>
<summary>Logout screen (wlogout)</summary>

![wlogout](https://github.com/user-attachments/assets/b1830c65-ac56-45e2-a5f8-514ec3c16eec)

</details>

<details>
<summary>Lockscreen (hyprlock)</summary>

![hyprlock](https://github.com/user-attachments/assets/7b29b61b-30c7-486a-9924-018f0a4b595c)

</details>

## License

My dotfiles are licensed under the ~cuck~ MIT license. Feel free to take inspiration or take parts
from them.
