{
  config,
  lib,
  pkgs,
  ...
}: {
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    settings = {
      # Allow host names to be used in authorized_keys
      UseDns = true;
      # Forbid root login through SSH
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };
}
