# Tab-complete directories under ~/Developer for `c`.
# `c so` -> `c some/`, then `c some/pro` -> `c some/project/`.

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
    if test -n "$dirpart"
        set base "$root/$dirpart"
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
        set -l name (string split -r -m1 / -- $entry)[-1]
        if test "$name" = . -o "$name" = ..
            continue
        end
        if test -n "$pat"
            string match -q -r -- "^$pat" "$name"; or continue
        end
        if test -n "$dirpart"
            printf '%s\n' "$dirpart/$name/"
        else
            printf '%s\n' "$name/"
        end
    end
end

complete -c c -f -a '(__c_complete_projects)'
