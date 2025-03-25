function prompt_symbol -a last_status
   if test "$USER" = "root"
      set symbol "#"
      set_color -o red
   else
      set symbol "❯"
      if test $last_status -ne 0
         set_color red
      else
         set_color magenta
      end
   end

   echo -n "$symbol "(set_color normal)
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
