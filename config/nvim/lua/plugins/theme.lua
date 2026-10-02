-- On Omarchy, load the live theme file Quattro writes. Anywhere else, use
-- LazyVim's default colorscheme. This file is not a symlink to the Omarchy
-- state path, because that path does not exist on other machines.
local omarchy_theme = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")
if vim.fn.filereadable(omarchy_theme) == 1 then
  return dofile(omarchy_theme)
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
