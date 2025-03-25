function background_jobs
   if test (jobs -q | count) -gt 0
      echo -n (set_color brblue)" $job_count"
   end
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
