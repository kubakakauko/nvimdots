---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "github_dark",
  theme_toggle = { "github_dark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  lsp_semantic_tokens = true,
  nvdash = {
    load_on_startup = true,
  },

  statusline ={
    theme = "minimal",
    separator_style = "round",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"


return M
