function reload --description 'Reload fish with the config from disk'
    # Sourcing config.fish again would prepend PATH and wrap the prompt twice.
    # Replacing the process reads conf.d, config.fish, functions, and completions
    # the same way a new terminal does. The working directory stays.
    if not status is-interactive
        echo 'reload is for an interactive fish.' >&2
        return 1
    end

    if status is-login
        exec fish --login
    else
        exec fish
    end
end
