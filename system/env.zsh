# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='rmate -w'
  export VISUAL='rmate -w'
elif test "$(uname)" = "Linux"; then
  export EDITOR='hx'
  export VISUAL='hx'
elif test "$(uname)" = "Darwin"; then
  export EDITOR='mate -w'
  export VISUAL='mate -w'
fi
