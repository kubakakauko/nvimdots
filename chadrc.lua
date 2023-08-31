---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
require "custom.configs.neovide"
-- require "custom.configs.nvterm"

M.ui = {
  theme = "tokyodark",
  theme_toggle = { "tokyodark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = true,


  nvdash = {
    load_on_startup = true,
  },

  statusline ={
    theme = "default",
    separator_style = "default",
  },

  tabufline = {
    lazyload = true,
    overriden_modules = nil,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
