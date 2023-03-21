# Add each topic folder to fpath so that they can add functions and completion scripts.
for topic_folder ($ZSH/*) if [ -d $topic_folder ]; then  fpath=($topic_folder $fpath); fi;

# Add homebrew's fpath (autocompletions are loaded from there).
if type -p brew >/dev/null 2>/dev/null
then
  fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fi
