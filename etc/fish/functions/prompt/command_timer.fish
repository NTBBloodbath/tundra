function command_timer
   if test "$CMD_DURATION" -gt 5000
      set -l duration (math -s0 "$CMD_DURATION / 1000")
      echo (set_color brblack)"󱦟 "(printf "%.0fs" $duration)
   end
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
