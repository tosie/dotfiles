if command -v mise &> /dev/null
then
  eval "$(mise activate zsh)"
  eval "$(mise hook-env -s zsh)"
  # eval "$(mise activate zsh --shims)"
fi
