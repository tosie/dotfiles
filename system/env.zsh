# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='rmate'
else
  export EDITOR='mate'
fi
