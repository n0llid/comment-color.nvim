local M = {}

M.default = {
  highlight = {
    fg = "#eb6f92", -- Default rose pine moon love
    bold = true,
  },
  toggle_key = "<leader>cc", -- Disable with `false`
  notifications = true,
  persist_state = false,     -- Requires plugin
}

M.options = {}

function M.setup(user_config)
  M.options = vim.tbl_deep_extend("force", M.default, user_config or {})

  -- Set keymap if configured
  if M.options.toggle_key then
    vim.keymap.set("n", M.options.toggle_key, require("comment-color").toggle, {
      desc = "Toggle comment highlights",
    })
  end
end

return M
