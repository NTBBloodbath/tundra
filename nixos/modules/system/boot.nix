{
  config,
  pkgs,
  ...
}: {
  # System hostname
  networking.hostName = "tundra";

  # Bootloader
  boot = {
    loader = {
      timeout = 3;
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        consoleMode = "auto";
        configurationLimit = 3;
      };
    };
    plymouth.enable = true;
    initrd.kernelModules = ["amdgpu"];
    # KERNEL PARAMETER                       | Parameter description
    # ---------------------------------------+---------------------------------------------------------------------------------------
    # rw                                     | mounts root read/write
    # quiet                                  | shut up Linux
    # rd.systemd.show_status=auto            | shut up SystemD
    # splash                                 | show a nice splash art while loading
    # sysrq_always_enabled=1                 | In case something freezes the system, makes the Magic Sysrq Key work
    # cpufreq.default_governor=performance   | Set CPU governor to performance
    kernelParams = ["rw" "quiet" "rd.systemd.show_status=auto" "splash" "sysrq_always_enabled=1" "cpufreq.default_governor=performance"];
  };

  # Mount my external FireCuda drive
  fileSystems."/mnt/Juegos" = {
    device = "/dev/disk/by-label/Juegos";
    fsType = "ext4";
    options = ["nofail" "x-systemd.device-timeout=5" "rw" "user" "exec" "relatime" "data=writeback" "nobh"];
  };

  # Configure console (TTY) keymap
  console.keyMap = "la-latin1";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html)
  #
  # Also make sure to check https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
