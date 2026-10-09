function reload --description 'Reload fish config from disk'
    set -l config_dir $__fish_config_dir
    if test -z "$config_dir"
        set config_dir $HOME/.config/fish
    end

    # iTerm copies fish_prompt and then skips setup once iterm2_status exists.
    # Put the unwrapped prompt back so config.fish can init Starship and wrap it once.
    if functions -q iterm2_fish_prompt
        functions -e fish_prompt
        functions -c iterm2_fish_prompt fish_prompt
        functions -e iterm2_fish_prompt
    end
    if functions -q iterm2_fish_mode_prompt
        functions -e fish_mode_prompt
        functions -c iterm2_fish_mode_prompt fish_mode_prompt
        functions -e iterm2_fish_mode_prompt
    end
    functions -e iterm2_status iterm2_preexec

    for file in $config_dir/conf.d/*.fish
        test -f "$file" || continue
        source $file
    end

    if test -f $config_dir/config.fish
        source $config_dir/config.fish
    end

    for file in $config_dir/functions/*.fish
        test -f "$file" || continue
        set -l name (string replace -r '\.fish$' '' -- (path basename -- $file))
        functions -e $name
        source $file
    end

    for file in $config_dir/completions/*.fish
        test -f "$file" || continue
        set -l name (string replace -r '\.fish$' '' -- (path basename -- $file))
        complete --erase --command $name
        source $file
    end
end
