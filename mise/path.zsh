if test "$(which brew)"
then
  eval "$(mise activate zsh)"
  eval "$(mise hook-env -s zsh)"
  # eval "$(mise activate zsh --shims)"
fi
