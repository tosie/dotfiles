function be --description 'bundle exec' --wraps 'bundle exec'
    bundle exec $argv
end

function ber --description 'bundle exec rails' --wraps 'bundle exec rails'
    bundle exec rails $argv
end
