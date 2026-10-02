# Tab-complete directories under ~/Developer for `c`.
# Matching ignores case. The inserted path uses each directory's real name.
# `c so` -> `c some/`, then `c some/pro` -> `c some/project/`.

function __c_child_name
    string split -r -m1 / -- $argv[1]
end

# Print the child of $base whose name equals $part, ignoring case.
# An exact-case match wins when both exist.
function __c_find_child
    set -l base $argv[1]
    set -l part $argv[2]
    set -l folded ""
    for entry in "$base"/* "$base"/.*
        test -d "$entry"; or continue
        set -l name (__c_child_name $entry)[-1]
        if test "$name" = . -o "$name" = ..
            continue
        end
        if test "$name" = "$part"
            printf '%s\n' $name
            return 0
        end
        if test -z "$folded"; and test (string lower -- $name) = (string lower -- $part)
            set folded $name
        end
    end
    if test -n "$folded"
        printf '%s\n' $folded
        return 0
    end
    return 1
end

function __c_complete_projects
    set -l root "$HOME/Developer"
    test -d "$root"; or return 0

    # Only the first argument is a project path.
    set -l tokens (commandline -opc)
    test (count $tokens) -le 1; or return 0

    set -l token (commandline -ct)
    set -l raw (string unescape -- $token 2>/dev/null)
    or set raw $token

    set -l dirpart ""
    set -l partial $raw
    if string match -q '*/*' -- $raw
        set dirpart (string replace -r '/[^/]*$' '' -- $raw)
        set partial (string replace -r '^.*/' '' -- $raw)
    end

    set -l base "$root"
    set -l resolved ""
    if test -n "$dirpart"
        for part in (string split / -- $dirpart)
            test -n "$part"; or continue
            set -l found (__c_find_child $base $part)
            or return 0
            if test -n "$resolved"
                set resolved "$resolved/$found"
            else
                set resolved $found
            end
            set base "$base/$found"
        end
    end
    test -d "$base"; or return 0

    set -l entries
    if string match -q '.*' -- $partial
        set entries "$base"/.*
    else
        set entries "$base"/*
    end

    set -l pat ""
    if test -n "$partial"
        set pat (string escape --style=regex -- $partial)
    end

    for entry in $entries
        test -d "$entry"; or continue
        set -l name (__c_child_name $entry)[-1]
        if test "$name" = . -o "$name" = ..
            continue
        end
        if test -n "$pat"
            string match -q -i -r -- "^$pat" "$name"; or continue
        end
        if test -n "$resolved"
            printf '%s\n' "$resolved/$name/"
        else
            printf '%s\n' "$name/"
        end
    end
end

complete -c c -f -a '(__c_complete_projects)'
