function vcs_status
   set -l git_status (git_status)
   set -l jj_status (jj_status)
   string join " " $git_status $jj_status
end

function git_status
   if command -sq git && git rev-parse --is-inside-work-tree >/dev/null 2>&1
      set -l branch (git branch --show-current 2>/dev/null | string trim)
      if test -n "$branch"
         set -l dirty (git status --porcelain 2>/dev/null)
         set -l status_symbol
         if test -n "$dirty"
            set status_symbol "*"
         end

         # Check upstream status
         set -l upstream (git rev-list --count --left-right @{upstream}...HEAD 2>/dev/null)
         if test $status -eq 0
            set -l behind (echo $upstream | cut -f1)
            set -l ahead (echo $upstream | cut -f2)
            set upstream_status ""
            if test $behind -gt 0
               set upstream_status "↓$behind"
            end
            if test $ahead -gt 0
               set upstream_status "$upstream_status↑$ahead"
            end
         end

         echo (set_color cyan)"git:("(set_color yellow)"$branch"(set_color cyan)")$status_symbol$upstream_status"
      end
   end
end

function jj_status
   # Stolen from https://github.com/IlanCosman/tide/pull/530
   # and slightly modified the output
   if not command -sq jj; or not jj root --quiet &>/dev/null
      return 1
   end

   set jj_status (jj log -r@ -n1 --no-graph --color always -T '
   separate(" ",
       bookmarks.map(|x| if(
           x.name().substr(0, 10).starts_with(x.name()),
           x.name().substr(0, 10),
           x.name().substr(0, 9) ++ "…")
       ).join(" "),
       tags.map(|x| if(
           x.name().substr(0, 10).starts_with(x.name()),
           x.name().substr(0, 10),
           x.name().substr(0, 9) ++ "…")
       ).join(" "),
       surround("\"","\"",
           if(
               description.first_line().substr(0, 24).starts_with(description.first_line()),
               description.first_line().substr(0, 24),
               description.first_line().substr(0, 18) ++ "…"
           )
       ),
       change_id.shortest(),
       commit_id.shortest(),
       diff.files().len() ++ "m",
       diff.stat().total_added() ++ "+",
       diff.stat().total_removed() ++ "-",
       if(conflict, "conflict"),
       if(divergent, "divergent"),
       if(hidden, "hidden"),
   )' | string trim)
   echo (set_color cyan)"jj:("(set_color normal)"$jj_status"(set_color cyan)")"(set_color normal)
end

# vim: sw=3:ts=3:sts=3:ft=fish:fdm=marker:fdl=0
