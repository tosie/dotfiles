# Documentation: https://github.com/cantino/mcfly

if [[ -o interactive ]]; then
  if test "$(which mcfly)"
  then
    # export MCFLY_LIGHT=TRUE
    # export MCFLY_KEY_SCHEME=vim
    # export MCFLY_INTERFACE_VIEW=BOTTOM
    export MCFLY_FUZZY=2
    export MCFLY_RESULTS=45
    export MCFLY_PROMPT="❯"

    eval "$(mcfly init zsh)"
  fi
fi
