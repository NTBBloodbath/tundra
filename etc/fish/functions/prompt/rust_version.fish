function rust_version
   if command -q rustc
      set -l rust_version (command rustc --version 2>/dev/null | string split ' ')[2]
      if not set -q __cached_rust_version or "$__cached_rust_version" != "$rust_version"
         set -g __cached_rust_version "$rust_version"
      end
      echo -n (set_color brred)" v$__cached_rust_version"
   end
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
