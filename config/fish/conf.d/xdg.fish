set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx XDG_CACHE_HOME $HOME/.cache
if test -z "$XDG_RUNTIME_DIR"; and command -q uname; and test (uname) != Darwin
    if test -n "$UID"; and test -d /run/user/$UID
        set -gx XDG_RUNTIME_DIR /run/user/$UID
    end
end
