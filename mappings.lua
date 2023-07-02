---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}


M.trouble = {
  n = {
    ["<leader>tt"] = {"<cmd>TroubleToggle<cr>", "Trouble"},
    ["<leader>tw"] = {"<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics"},
    ["<leader>td"] = {"<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics"},
    ["<leader>tq"] = {"<cmd>TroubleToggle quickfix<cr>", "Quickfix"},
    ["<leader>tl"] = {"<cmd>TroubleToggle loclist<cr>", "Loclist"},
    ["<leader>tr"] = {"<cmd>TroubleToggle lsp_references<cr>", "References"},
  },
}

M.window_picker = {
  n = {
    -- An awesome method to jump to windows
    [",w"] = {
      function()
        local picker = require('window-picker')
        local picked_window_id = picker.pick_window({
          include_current_win = true
        }) or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
      end,
      "Pick a window",
    },

    -- Swap two windows using the awesome window picker
    [",W"] = {
      function()
        local picker = require('window-picker')
        local window = picker.pick_window({
          include_current_win = false
        })
        local target_buffer = vim.fn.winbufnr(window)
        -- Set the target window to contain current buffer
        vim.api.nvim_win_set_buf(window, 0)
        -- Set current window to contain target buffer
        vim.api.nvim_win_set_buf(0, target_buffer)
      end,
      "Swap windows",
    },
  },
}

return M
