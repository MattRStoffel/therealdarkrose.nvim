local config = require("darkrose.config")

local M = {
  options = {
    colors = {}, -- Overrides for colors
    overrides = function() end, -- Overrides for highlight groups
  },
}

function M.setup(user_config)
  if user_config ~= nil then
    M.options = vim.tbl_deep_extend("force", M.options, user_config)
  end

  M.colorscheme()
end

function M.colorscheme()
  -- if vim.g.colors_name then
  --   vim.cmd("hi clear")
  -- end

  vim.opt.termguicolors = true
  vim.g.colors_name = "darkrose"

  config.apply_highlights(M.options)
end

return M
