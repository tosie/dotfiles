if status is-interactive; and command -q docker
    mkdir -p $HOME/.config/fish/completions
    set -l dest $HOME/.config/fish/completions/docker.fish
    if not test -s $dest
        docker completion fish >$dest
    end
end
