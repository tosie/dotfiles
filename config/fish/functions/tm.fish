function tm --description 'Attach the main tmux session'
    tmux -CC new -A -s main $argv
end
