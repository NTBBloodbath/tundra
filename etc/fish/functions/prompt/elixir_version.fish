function elixir_version
   if command -q elixir
      set -l elixir_version (command elixir --version | grep "Elixir" | string split " ")[2]
      if not set -q __cached_elixir_version or "$__cached_elixir_version" != "$elixir_version"
         set -g __cached_elixir_version "$elixir_version"
      end
      echo -n (set_color magenta)" v$__cached_elixir_version"
   end
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
