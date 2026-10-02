# Windows fish does not run a Unix shebang. Git for Windows provides bash.exe.
# These functions shadow the scripts in ~/.local/bin so imgcat and it2* work
# in an OpenSSH session whose shell is fish.
if test "$OS" = Windows_NT
    function __iterm_run --argument-names helper
        set -l bash bash.exe
        if not command -q bash.exe
            if test -n "$PROGRAMFILES"; and test -f "$PROGRAMFILES/Git/bin/bash.exe"
                set bash "$PROGRAMFILES/Git/bin/bash.exe"
            end
        end
        $bash "$HOME/.local/bin/$helper" $argv[2..]
    end

    function imgcat --wraps imgcat
        __iterm_run imgcat $argv
    end
    function imgls --wraps imgls
        __iterm_run imgls $argv
    end
    function it2api --wraps it2api
        __iterm_run it2api $argv
    end
    function it2attention --wraps it2attention
        __iterm_run it2attention $argv
    end
    function it2check --wraps it2check
        __iterm_run it2check $argv
    end
    function it2copy --wraps it2copy
        __iterm_run it2copy $argv
    end
    function it2dl --wraps it2dl
        __iterm_run it2dl $argv
    end
    function it2getvar --wraps it2getvar
        __iterm_run it2getvar $argv
    end
    function it2git --wraps it2git
        __iterm_run it2git $argv
    end
    function it2setcolor --wraps it2setcolor
        __iterm_run it2setcolor $argv
    end
    function it2setkeylabel --wraps it2setkeylabel
        __iterm_run it2setkeylabel $argv
    end
    function it2ul --wraps it2ul
        __iterm_run it2ul $argv
    end
    function it2universion --wraps it2universion
        __iterm_run it2universion $argv
    end
end
