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
      # Utilities
      fd
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
      pure
      sponge
      autopair
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
