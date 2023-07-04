---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.trouble = {
  n = {
    ["<leader>t"] = { "Trouble" },
    ["<leader>tt"] = { "<cmd>TroubleToggle<cr>", "Trouble" },
    ["<leader>tw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
    ["<leader>tx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    ["<leader>tq"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    ["<leader>tl"] = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
    ["<leader>tr"] = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  },
}

M.rust = {
  n = {
    ["<leader>rr"] = { "<cmd>Cargo run<cr>", "Run Cargo" },
    ["<leader>rb"] = { "<cmd>Cargo build<cr>", "Build Cargo" },
    ["<leader>rt"] = { "<cmd>Cargo test<cr>", "Test Cargo" },
  },
}

M.ale = {
  n = {
    ["<leader>a"] = { "Ale" },
    ["<leader>an"] = { "<cmd>ALENext<cr>", "Next ALE Warning/Error" },
    ["<leader>ap"] = { "<cmd>ALEPrevious<cr>", "Previous ALE Warning/Error" },
    ["<leader>af"] = { "<cmd>ALEFix<cr>", "Fix ALE Issues" },
  },
}

M.window_picker = {
  n = {
    -- An awesome method to jump to windows
    [",w"] = {
      function()
        local picker = require "window-picker"
        local picked_window_id = picker.pick_window {
          include_current_win = true,
        } or vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(picked_window_id)
      end,
      "Pick a window",
    },

    -- Swap two windows using the awesome window picker
    [",W"] = {
      function()
        local picker = require "window-picker"
        local window = picker.pick_window {
          include_current_win = false,
        }
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

-- Keybindings for goto-preview
M.goto_preview = {
  n = {
    ["gpd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "Go to definition preview" },
    ["gpi"] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", "Go to implementation preview" },
    ["gP"] = { "<cmd>lua require('goto-preview').close_all_win()<cr>", "Close all windows" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}
return M
