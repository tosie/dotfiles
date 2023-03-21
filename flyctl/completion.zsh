if type -p brew >/dev/null 2>/dev/null
then
  completion="$(brew --prefix)/share/zsh/site-functions/_flyctl"

  if test -f $completion
  then
    source $completion
  fi
fi
