{
  lib,
  pkgs,
  ...
}: {
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable Android Debug Bridge
  programs.adb.enable = true;

  # Enable direnv integration (+ nix-direnv)
  programs.direnv = {
    enable = true;
    silent = true; # direnv is way too verbose
    nix-direnv.enable = true;
  };

  # Enable FISH shell
  programs.fish = {
    enable = true;
    shellAliases = lib.mkForce {}; # Get rid of these annoying ls aliases
  };

  # Enable NH
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/home/amartin/tundra";
  };

  # Install system-wide packages (+ FISH shell plugins)
  environment.systemPackages =
    (with pkgs; [
      # Essentials
      git
      helix
      # Archives
      zip
      unzip
      rar
      unrar
      p7zip
      # Utilities
      fd
      zf
      eza
      fzf
      btop
      wget
      yazi
      ripgrep
      tealdeer
      lm_sensors
      smartmontools
      # Misc
      fastfetch
    ])
    ++ (with pkgs.fishPlugins; [
      fzf
      bass
      done
      sponge
      autopair
      async-prompt
      colored-man-pages
    ]);

  # Initialize FISH from BASH without replacing the default shell
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
