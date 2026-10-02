if command -q uname; and test (uname) = Darwin
    set -gx HOMEBREW_NO_ANALYTICS 1
    if test -x /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv | source
    else if test -x /usr/local/bin/brew
        /usr/local/bin/brew shellenv | source
    end
end
