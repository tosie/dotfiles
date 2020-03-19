export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
[[ ! -f $VIRTUALENVWRAPPER_PYTHON ]] || [[ ! -f /usr/local/bin/virtualenvwrapper.sh ]] || source /usr/local/bin/virtualenvwrapper.sh
