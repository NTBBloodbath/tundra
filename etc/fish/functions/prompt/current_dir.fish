function current_dir
   set -l dir_color (set_color brblue)
   echo -n $dir_color(prompt_pwd --dir-length=3 --full-length-dirs=2)
   set_color normal
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
