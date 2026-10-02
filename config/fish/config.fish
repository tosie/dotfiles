# This file is a whole-file symlink, so mise activation lives here.
# Do not also set [bootstrap.mise_shell_activate] for fish.

if status is-interactive
    if not set -q LANG
        set -gx LANG en_US.UTF-8
        set -gx LANGUAGE en_US.UTF-8
        set -gx LC_ALL en_US.UTF-8
    end

    if command -q mise
        mise activate fish | source
    end

    if command -q starship
        starship init fish | source
    end

    if command -q atuin
        atuin init fish | source
        # Ctrl-R is Atuin (session, then directory, then global).
        # Up and Down stay fish prefix search.
        bind up up-or-search
        bind down down-or-search
    end

    # Wrap the prompt after Starship so iTerm marks do not replace it.
    source (dirname (status filename))/iterm2_shell_integration.fish

    set -gx EDITOR nvim

    # Running fastfetch on every new terminal is too much.
    # if command -q fastfetch
    #     fastfetch
    # end
end
