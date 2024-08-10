{
  config,
  inputs,
  pkgs,
  ...
}: {
  users.users = {
    amartin = {
      isNormalUser = true;
      description = "Alejandro Martin";
      extraGroups = ["networkmanager" "wheel" "adbusers"];
      openssh.authorizedKeys.keys = [
        # TODO: Add my SSH public key here
      ];
      packages = with pkgs; [
        # Terminal emulator
        inputs.ghostty.packages."${pkgs.system}".default
        # Utilities
        hyperfine
        wl-clipboard
        gnome-tweaks
        # Social
        vesktop
      ];
    };
  };
}
