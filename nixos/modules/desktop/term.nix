{ config, lib, pkgs, ... }:

{
  options = {
    term.enable = lib.mkEnableOption "enable terminal utilities";
  };

  config = lib.mkIf config.term.enable {
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    # Enable Android Debug Bridge
    programs.adb.enable = true;

    # Install system-wide packages (+ FISH shell plugins)
    environment.systemPackages = (with pkgs; [
      # Essentials
      git
      fish
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
      ripgrep
      # Lua (required by Neovim to use rocks.nvim)
      lua51Packages.lua
      lua51Packages.luarocks
      # Misc
      fastfetch
    ]) ++ (with pkgs.fishPlugins; [
      fzf
      bass
      tide
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
  };
}
