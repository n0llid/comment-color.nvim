# comment-color.nvim

Toggle comments between bright highlights and your colorscheme's defaults.

## Features

- Toggle comments with one keybind
- Survives colorscheme changes
- Customizable colors and styles
- Optional state persistence
- Zero dependencies

## Installation
With [lazy.nvim](ADD LINK TO lazy.nvim):
```lua
{
    "y4zt/comment-color.nvim",
    opts = {
        highlight = {
            fg = "#FF5555", -- Bright color
            bold = true,
        },
        toggle_key = "<leader>cc",
        notifications = true,
        presist_state = false, -- Requires plugin nvim-possession
    }
}
```
With [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use("yourusername/comment-color.nvim")
