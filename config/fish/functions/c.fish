function c --description 'Jump into ~/Developer, or a project under it'
    if test (count $argv) -eq 0
        cd $HOME/Developer
    else
        cd $HOME/Developer/$argv[1]
    end
end
