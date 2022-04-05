# Source: https://gist.github.com/justgage/1641a2d04a2e59169bac7902886d44c4

compdef _mix mix

__mix_caching_policy() {
  oldp=( "$1"(Nmh+1) )            # 1 hour
  (( $#oldp ))
}

_mix() {
  # Elixir mix zsh completion

  local cache_policy

  zstyle -s ":completion:${curcontext}:" cache-policy cache_policy
  if [[ -z "$cache_policy" ]]; then
      zstyle ":completion:${curcontext}:" cache-policy __mix_caching_policy
  fi

  mix_help=$(mix help \
                       | tr -s ' '            \
                       | sed -e 's/ # /:/'    \
                             -e 's/^mix //'   \
                             -e 's/^mix:.*//' \
                             -e 's/^iex.*//'  )

  declare -a all_tasks
  all_tasks=($(echo $mix_help | sed 's/:.*//'))

  local -a _1st_arguments
  IFS=$'\n' _1st_arguments=($(echo $mix_help))

  _1st_arguments+=(
    '--help:Describe available tasks'
    '--version:Prints the Elixir version information'
  )

  __task_list ()
  {
    local expl
    _wanted tasks expl 'help' compadd $all_tasks
  }

  local expl

  local curcontext="$curcontext" state line
  typeset -A opt_args

  _arguments -C \
             ':command:->command' \
             '*::options:->options'

  case $state in
    (command)
      _describe -t commands "mix subcommand" _1st_arguments
      return
      ;;
    (options)
      case $line[1] in
        (help)
          _arguments ':feature:__task_list'
          ;;
        (test)
          _files
          ;;
      esac
      ;;
  esac
}
