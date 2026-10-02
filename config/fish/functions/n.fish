function n --description 'Open Neovim, or the current directory when called alone'
    if test (count $argv) -eq 0
        nvim .
    else
        nvim $argv
    end
end
