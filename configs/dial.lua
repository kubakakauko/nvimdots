local status_ok, dial_config = pcall(require, "dial.config")
if not status_ok then
  return
end

local augend = require "dial.augend"
dial_config.augends:register_group {
  default = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
  },
  typescript = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.constant.new { elements = { "let", "const" } },
  },
  visual = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.constant.alias.alpha,
    augend.constant.alias.Alpha,
  },
  mygroup = {
    augend.constant.new {
      elements = { "and", "or" },
      word = true,
      cyclic = true,
    },
    augend.constant.new {
      elements = { "True", "False" },
      word = true,
      cyclic = true,
    },
    augend.constant.new {
      elements = { "true", "false" },
      word = true,
      cyclic = true,
    },
    augend.constant.new {
      elements = { "public", "private" },
      word = true,
      cyclic = true,
    },
    augend.constant.new {
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    },
    augend.date.alias["%m/%d/%Y"],
    augend.constant.alias.bool,
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.semver.alias.semver,
  },
}

local map = require "dial.map"

vim.api.nvim_set_keymap("n", "<C-a>", map.inc_normal "mygroup", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-x>", map.dec_normal "mygroup", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-a>", map.inc_normal "visual", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-x>", map.dec_normal "visual", { noremap = true })
