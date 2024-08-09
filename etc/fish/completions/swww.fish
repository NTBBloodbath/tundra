complete -c swww -n "__fish_use_subcommand" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c swww -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c swww -n "__fish_use_subcommand" -f -a "clear" -d 'Fills the specified outputs with the given color'
complete -c swww -n "__fish_use_subcommand" -f -a "restore" -d 'Restores the last displayed image on the specified outputs'
complete -c swww -n "__fish_use_subcommand" -f -a "clear-cache" -d 'Clears the swww cache'
complete -c swww -n "__fish_use_subcommand" -f -a "img" -d 'Sends an image (or animated gif) for the daemon to display'
complete -c swww -n "__fish_use_subcommand" -f -a "kill" -d 'Kills the daemon'
complete -c swww -n "__fish_use_subcommand" -f -a "query" -d 'Asks the daemon to print output information (names and dimensions)'
complete -c swww -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c swww -n "__fish_seen_subcommand_from clear" -s o -l outputs -d 'Comma separated list of outputs to display the image at' -r
complete -c swww -n "__fish_seen_subcommand_from clear" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c swww -n "__fish_seen_subcommand_from restore" -s o -l outputs -d 'Comma separated list of outputs to restore' -r
complete -c swww -n "__fish_seen_subcommand_from restore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c swww -n "__fish_seen_subcommand_from clear-cache" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c swww -n "__fish_seen_subcommand_from img" -s o -l outputs -d 'Comma separated list of outputs to display the image at' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l resize -d 'Whether to resize the image and the method by which to resize it' -r -f -a "{no	'Do not resize the image',crop	'Resize the image to fill the whole screen, cropping out parts that don\'t fit',fit	'Resize the image to fit inside the screen, preserving the original aspect ratio'}"
complete -c swww -n "__fish_seen_subcommand_from img" -l fill-color -d 'Which color to fill the padding with when output image does not fill screen' -r
complete -c swww -n "__fish_seen_subcommand_from img" -s f -l filter -d 'Filter to use when scaling images (run swww img --help to see options)' -r
complete -c swww -n "__fish_seen_subcommand_from img" -s t -l transition-type -d 'Sets the type of transition. Default is \'simple\', that fades into the new image' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-step -d 'How fast the transition approaches the new image' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-duration -d 'How long the transition takes to complete in seconds' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-fps -d 'Frame rate for the transition effect' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-angle -d 'This is used for the \'wipe\' and \'wave\' transitions. It controls the angle of the wipe' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-pos -d 'This is only used for the \'grow\',\'outer\' transitions. It controls the center of circle (default is \'center\')' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-bezier -d 'bezier curve to use for the transition https://cubic-bezier.com is a good website to get these values from' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l transition-wave -d 'currently only used for \'wave\' transition to control the width and height of each wave' -r
complete -c swww -n "__fish_seen_subcommand_from img" -l no-resize -d 'Do not resize the image. Equivalent to `--resize=no`'
complete -c swww -n "__fish_seen_subcommand_from img" -l invert-y -d 'inverts the y position sent in \'transition_pos\' flag'
complete -c swww -n "__fish_seen_subcommand_from img" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c swww -n "__fish_seen_subcommand_from kill" -s h -l help -d 'Print help'
complete -c swww -n "__fish_seen_subcommand_from query" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from restore; and not __fish_seen_subcommand_from clear-cache; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "clear" -d 'Fills the specified outputs with the given color'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from restore; and not __fish_seen_subcommand_from clear-cache; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "restore" -d 'Restores the last displayed image on the specified outputs'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from restore; and not __fish_seen_subcommand_from clear-cache; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "clear-cache" -d 'Clears the swww cache'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from restore; and not __fish_seen_subcommand_from clear-cache; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "img" -d 'Sends an image (or animated gif) for the daemon to display'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from restore; and not __fish_seen_subcommand_from clear-cache; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "kill" -d 'Kills the daemon'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from restore; and not __fish_seen_subcommand_from clear-cache; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "query" -d 'Asks the daemon to print output information (names and dimensions)'
complete -c swww -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from restore; and not __fish_seen_subcommand_from clear-cache; and not __fish_seen_subcommand_from img; and not __fish_seen_subcommand_from kill; and not __fish_seen_subcommand_from query; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
