function bootstrap_dev
    set -l directories Clang Zig Rust Nvim Python Node Misc

    for devdir in $directories
        if test ! -d $HOME/Develop/$devdir
            mkdir -pv $HOME/Develop/$devdir
        end
    end
end
