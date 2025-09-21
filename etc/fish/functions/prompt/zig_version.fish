function zig_version
   if command -q zig
      set -l zig_version (command zig version 2>/dev/null)
      if not set -q __cached_zig_version or "$__cached_zig_version" != "$zig_version"
         set -g __cached_zig_version "$zig_version"
      end
      echo -n (set_color yellow)" v$__cached_zig_version"
   end
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
