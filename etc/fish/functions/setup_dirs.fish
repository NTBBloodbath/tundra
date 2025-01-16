function setup_dirs
   set --local dev_home_directory "$HOME/Develop"
   # Check ~/.config/fish/abbrev.fish to see which directories are enabled
   set --local dev_directories Zig Clang Elixir Ruby Rust Python Node Misc Nvim

   for directory in $dev_directories
      mkdir -v -p "$dev_home_directory/$directory"
   end
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
