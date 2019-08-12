# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='rmate -w'
else
  export EDITOR='mate -w'
fi
