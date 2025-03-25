function nix_shell
   if set -q IN_NIX_SHELL
      echo -n (set_color brcyan)" impure"
   end
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
