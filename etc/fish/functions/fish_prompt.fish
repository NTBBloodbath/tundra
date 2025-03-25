function fish_prompt
   set -l last_status $status

   # First line
   echo -n (current_dir) (vcs_status) (background_jobs)
   echo

   # Second line
   echo -n (nix_shell) (rust_version) (elixir_version) (command_timer) (prompt_symbol $last_status)
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
