# dotfiles

Fish, Starship, and Neovim, installed with [mise bootstrap](https://mise.jdx.dev/bootstrap.html). The same repo is the setup for macOS, Linux (headless or Hyprland), and Windows.

## Install

Install [mise](https://mise.jdx.dev/installing-mise.html), clone this repo, then from the repo root:

```sh
mise trust
mise bootstrap --dry-run
mise bootstrap
```

`mise bootstrap` is the same command on every machine. When the `Hyprland` binary is installed, the Ghostty config gains `async-backend = epoll`. After you install Hyprland later, run `mise bootstrap` again. This repo does not install a desktop.

Make fish the login shell yourself. On macOS and Linux, `chsh` to the `fish` on your `PATH`. On Windows, set fish as the Windows Terminal profile. `mise bootstrap remote` does not target native Windows SSH, so run bootstrap on the machine itself.

Fish is not in winget. On Windows, install fish from [fishshell.com](https://fishshell.com/) before the fish config is useful. The other Windows tools come from winget.

## Layout

`mise.toml` is the installer. It declares packages, links, the Hyprland Ghostty template, and macOS defaults.

| Path | Lands on |
| --- | --- |
| `config/fish/` | `~/.config/fish/` (`conf.d` and `functions` are linked file by file, so a local file next to them is left alone) |
| `config/starship.toml` | `~/.config/starship.toml` |
| `config/atuin/config.toml` | `~/.config/atuin/config.toml` |
| `config/ghostty/` | `~/.config/ghostty/` on macOS and Linux |
| `config/fastfetch/` | `~/.config/fastfetch/` |
| `config/tmux/tmux.conf` | `~/.config/tmux/tmux.conf` |
| `config/git/` | `~/.config/git/` |
| `config/nvim/` | `~/.config/nvim` |
| `config/ruby/gemrc`, `irbrc` | `~/.gemrc`, `~/.irbrc` |
| `bin/it2*`, `imgcat`, `imgls`, `rmate` | `~/.local/bin` |
| `bin/pbcopy` | `~/.local/bin` on Linux and Windows |

`config/fish/config.fish` contains `mise activate fish | source`. Do not also set `[bootstrap.mise_shell_activate]` for fish. Mise skips that generated block when this file already owns the path.

An old `~/.gitconfig`, `~/.zshrc`, `~/.zprofile`, `~/.p10k.zsh`, `~/.vimrc`, `~/.tmux.conf`, `~/.gitignore`, or `~/.localrc` is removed on bootstrap so it does not shadow the new files.

## Tools

Installed with Homebrew on macOS, apt or pacman on Linux, and winget on Windows, where that package exists. Apt names match Debian. An older Ubuntu release may not ship every one of them yet.

Shared: fish (not winget), starship, neovim, git, mise, atuin, tmux (not winget), difftastic, lazygit, fastfetch, btop, glow, flyctl (not pacman), watch (Homebrew and apt). `usage` is a mise tool (`usage = "latest"`), so it is installed on every platform.

Unix only: mosh, nnn, ncdu, lnav, Ghostty.

macOS only: Homebrew `shellenv` with analytics off, Kaleidoscope and difftastic in the macOS git include, Postgres.app on `PATH` when that app is installed, and the macOS defaults from the old `macos/set-defaults.sh`.

Windows does not get Ghostty, iTerm, Postgres.app, Kaleidoscope, or Homebrew. The iTerm helper scripts are still installed.

## Shell

Fish is the interactive shell. Starship is the prompt (the same `starship.toml` Omarchy uses). Ctrl-R is Atuin: it cycles session, directory, then global. Enter runs the line. Tab edits it. Up and Down stay fish prefix search.

Atuin starts offline. To sync later, run `atuin register` for the hosted service, or set `sync_address` in `~/.config/atuin/config.toml` for a server you run. Leave it unset to stay local. The encryption key (`~/.local/share/atuin/key`) and the session token stay on the machine. Import existing history once, yourself, with `atuin import auto`.

`c` jumps into `~/Developer`. `tm` attaches the tmux session named `main`. `n` opens Neovim, and opens the current directory when called with no arguments. Docker keeps `d`, `d-c`, `dcd`, `dcu`, and `dcud`. Ruby keeps `be` and `ber`.

## Git

The alias list, the macOS, Linux, and Windows includes, and rerere stay. The default branch is `main`. Copy `config/git/local.example` to `~/.config/git/local` and put your name and email there. That file is gitignored. `git` is the real git binary.

## Editor

Neovim uses the LazyVim starter plus the Omarchy overlay in `config/nvim`. The first `nvim` launch installs plugins. `Space` is the leader key. `EDITOR` is `nvim`.

On Omarchy, `theme.lua` loads `~/.local/state/omarchy/current/theme/neovim.lua` when Quattro has written it, and reloads that file when Omarchy emits `LazyReload`. On every other machine the colorscheme is tokyonight.

## iTerm

`imgcat`, `imgls`, `it2*`, and `rmate` are on `PATH` everywhere. The image and `it2*` scripts print iTerm escape sequences, so they display when you SSH in from iTerm on macOS. `rmate` opens a file in an rmate listener on the machine you SSH from. `pbcopy` is the same clipboard script as `it2copy` and is installed on Linux and Windows, which is what tmux copy mode calls. On macOS the system `pbcopy` stays on `PATH`. On Windows, fish runs these scripts with `bash.exe` from Git for Windows. The iTerm app itself is not installed on Linux or Windows. Fish also loads iTerm's shell integration so prompt marks work over that SSH session.

## Ghostty and Hyprland

The Ghostty config uses Gruvbox, Berkeley Mono at 14pt, and Shift+Enter as a newline for Claude Code. `config/ghostty/config.d/hyprland.tera` is rendered to `~/.config/ghostty/config.d/hyprland`. The render runs `command -v Hyprland`. When that binary is present the file contains `async-backend = epoll`. When it is absent the file is empty.
