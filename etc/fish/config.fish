# Personal configurations {{{
# Remove fish greeting
set -U fish_greeting

# Use vi mode by default, can be disabled by using fish_default_key_bindings
fish_vi_key_bindings

# Load aliases, environment variables, etc
source $HOME/.config/fish/env.fish
source $HOME/.config/fish/abbrev.fish
source $HOME/.config/fish/aliases.fish
test -e $XDG_CONFIG_HOME/fish/tk.fish && source $XDG_CONFIG_HOME/fish/tk.fish
# }}}

if command -qs direnv
   direnv hook fish | source
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
