local M = {}
local config = require("comment-color.config")

local state = {
  enabled = false,
  original_hl = nil,
}

local function get_comment_hl()
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = "Comment", link = false })
  return ok and hl or {}
end

function M.toggle()
  if not state.enabled then
    state.original_hl = get_comment_hl()
    vim.api.nvim_set_hl(0, "Comment", config.options.highlight)
    state.enabled = true
  else
    if state.original_hl then
      vim.api.nvim_set_hl(0, "Comment", state.original_hl)
    else
      vim.cmd("hi! clear Comment")
    end
    state.enabled = false
  end

  if config.options.notifications then
    vim.notify("Comment Color: " .. (state.enabled and "ON" or "OFF"))
  end
end

function M.setup(user_config)
  config.setup(user_config)
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      if state.enabled then
        vim.api.nvim_set_hl(0, "Comment", config.options.highlight)
      end
    end,
  })
end

return M
