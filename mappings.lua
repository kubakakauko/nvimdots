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

M.dap_old = {
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

M.dap = {
  plugin = true,
  n = {
    ["<F5>"] = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
    ["<F10>"] = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
    ["<F11>"] = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
    ["<F12>"] = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
    ["<leader>b"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
    ["<leader>B"] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Set Breakpoint" },
    ["<leader>lp"] = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "Set Log Point" },
    ["<leader>da"] = { "<cmd>lua require'dap'.repl.open()<CR>", "Open REPL" },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<CR>", "Run Last" },
  },
}

M.dapui = {
  plugin = true,
  n = {
    ["<leader>du"] = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle DAP UI" },
    ["<leader>de"] = { "<cmd>lua require'dapui'.eval()<CR>", "Evaluate" },
  },
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

-- Your custom mappings
M.bufresize = {
  n = {
    ["<leader>w<"] = {":lua require('bufresize').resize('w', -30)<CR>", "Resize window width -30"},
    ["<leader>w>"] = {":lua require('bufresize').resize('w', 30)<CR>", "Resize window width +30"},
    ["<leader>w+"] = {":lua require('bufresize').resize('h', 10)<CR>", "Resize window height +10"},
    ["<leader>w-"] = {":lua require('bufresize').resize('h', -10)<CR>", "Resize window height -10"},
    ["<leader>w_"] = {":lua require('bufresize').max_height()<CR>", "Maximize window height"},
    ["<leader>w="] = {":lua require('bufresize').equalize()<CR>", "Equalize window sizes"},
    ["<leader>w|"] = {":lua require('bufresize').max_width()<CR>", "Maximize window width"},
    ["<leader>wo"] = {":lua require('bufresize').maximize()<CR>", "Maximize window"},
  }
}

return M
