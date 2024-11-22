# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’)
{
  imports = [
    ./modules
    ./../hosts/workstation/hardware-configuration.nix
  ];

  # Enable OpenGL and hardware accelerated graphics drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nix = {
    # Perform garbage collection weekly to maintain low disk usage
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };

    # Automatically run the nix store optimiser by using a systemd timer
    optimise.automatic = true;

    settings = {
      # Deduplicate and optimize storage
      # You can also manually optimize the store via:
      #    nix-store --optimise
      # Refer to the following link for more details:
      # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
      auto-optimise-store = true;
      # Set up Nix experimental features
      experimental-features = ["nix-command" "flakes"];
    };

    # So that devenv can handle the caching for me
    extraOptions = ''
      trusted-users = root amartin
    '';
  };
}
