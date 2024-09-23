{
  inputs,
  pkgs,
  ...
}: {
  users.users = {
    amartin = {
      isNormalUser = true;
      description = "Alejandro Martin";
      extraGroups = ["networkmanager" "wheel" "adbusers" "input"];
      openssh.authorizedKeys.keys = [
        # TODO: Add my SSH public key here
      ];
      packages = with pkgs; [
        # Terminal emulators
        kitty # required to get the kitten utility to display images on Ghostty
        inputs.ghostty.packages."${pkgs.system}".default
        # Utilities
        jujutsu
        hyperfine
        wl-clipboard
        # Social
        vesktop
        # Misc
        # godot_4
        easyeffects # Audio effects
        devilutionx # Diablo on steroids
      ];
    };
  };
}
