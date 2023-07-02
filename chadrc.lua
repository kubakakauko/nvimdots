---@type ChadrcConfig
local M = {}

-- Options
-- vim.opt.relativenumber = true

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "doomchad",
  theme_toggle = { "doomchad", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

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
