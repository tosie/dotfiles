function d --description 'docker' --wraps docker
    docker $argv
end

function d-c --description 'docker compose' --wraps 'docker compose'
    docker compose $argv
end

function dcd --description 'docker compose down'
    docker compose down $argv
end

function dcu --description 'docker compose up'
    docker compose up $argv
end

function dcud --description 'docker compose up -d'
    docker compose up -d $argv
end
