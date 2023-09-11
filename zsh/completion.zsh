# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# Makes completion work for fly.io's `flyctl` command when just using `fly`.
compdef _flyctl fly