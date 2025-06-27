function bg_jobs
   if test (count (jobs)) -gt 0
      echo -n (set_color brblue)" "(count (jobs))
   end
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
