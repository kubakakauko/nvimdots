---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.trouble = {
  n = {
    ["<leader>ot"] = { "+ Trouble" },
    ["<leader>ott"] = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
    ["<leader>otw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
    ["<leader>otx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
    ["<leader>otq"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
    ["<leader>otl"] = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
    ["<leader>otr"] = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  },
}

M.rust = {
  n = {
    ["<leader>orr"] = { "+ Rust" },
    ["<leader>orrr"] = { "<cmd>Cargo run<cr>", "Run Cargo" },
    ["<leader>orrb"] = { "<cmd>Cargo build<cr>", "Build Cargo" },
    ["<leader>orrt"] = { "<cmd>Cargo test<cr>", "Test Cargo" },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>orru"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}
M.ale = {
  n = {
    ["<leader>oa"] = { "+ Ale" },
    ["<leader>oan"] = { "<cmd>ALENext<cr>", "Next ALE Warning/Error" },
    ["<leader>oap"] = { "<cmd>ALEPrevious<cr>", "Previous ALE Warning/Error" },
    ["<leader>oaf"] = { "<cmd>ALEFix<cr>", "Fix ALE Issues" },
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
    ["<leader>o"] = { "+ Custom mappings" },
    ["<leader>op"] = { "+ Goto preview" },
    ["<leader>ogpd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", "Go to definition preview" },
    ["<leader>ogpi"] = {
      "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>",
      "Go to implementation preview",
    },
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<F5>"] = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
    ["<F10>"] = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
    ["<F11>"] = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
    ["<F12>"] = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
    ["<leader>b"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
    ["<leader>B"] = {
      "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      "Set Breakpoint",
    },
    ["<leader>odp"] = {
      "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
      "Set Log Point",
    },
    ["<leader>oda"] = { "<cmd>lua require'dap'.repl.open()<CR>", "Open REPL" },
    ["<leader>odl"] = { "<cmd>lua require'dap'.run_last()<CR>", "Run Last" },
    ["<leader>ods"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dapui = {
  plugin = true,
  n = {
    ["<leader>od"] = {"+ DAP"},
    ["<leader>odu"] = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle DAP UI" },
    ["<leader>ode"] = { "<cmd>lua require'dapui'.eval()<CR>", "Evaluate" },
  },
}


-- Your custom mappings
M.bufresize = {
  n = {
    ["<leader>orw"] = {"+ Resize buffer"},
    ["<leader>orw<"] = { ":lua require('bufresize').resize('w', -30)<CR>", "Resize window width -30" },
    ["<leader>orw>"] = { ":lua require('bufresize').resize('w', 30)<CR>", "Resize window width +30" },
    ["<leader>orw+"] = { ":lua require('bufresize').resize('h', 10)<CR>", "Resize window height +10" },
    ["<leader>orw-"] = { ":lua require('bufresize').resize('h', -10)<CR>", "Resize window height -10" },
    ["<leader>orw_"] = { ":lua require('bufresize').max_height()<CR>", "Maximize window height" },
    ["<leader>orw="] = { ":lua require('bufresize').equalize()<CR>", "Equalize window sizes" },
    ["<leader>orw|"] = { ":lua require('bufresize').max_width()<CR>", "Maximize window width" },
    ["<leader>owo"] = { ":lua require('bufresize').maximize()<CR>", "Maximize window" },
  },
}


M.lspsaga = {
  n = {
    ["gh"] = { ":Lspsaga lsp_finder<CR>", "Async Lsp Finder" },
    ["<leader>ca"] = { ":Lspsaga code_action<CR>", "Code Action" },
    ["K"] = { ":Lspsaga hover_doc<CR>", "Hover Doc" },
    ["<C-f>"] = { ":Lspsaga smart_scroll_with_saga(1)<CR>", "Scroll Down Hover Doc" },
    ["<C-b>"] = { ":Lspsaga smart_scroll_with_saga(-1)<CR>", "Scroll Up Hover Doc" },
    ["gs"] = { ":Lspsaga signature_help<CR>", "SignatureHelp" },
    ["gr"] = { ":Lspsaga rename<CR>", "Rename" },
    ["gd"] = { ":Lspsaga preview_definition<CR>", "Preview Definition" },
    ["<leader>cd"] = { ":Lspsaga show_line_diagnostics<CR>", "Show Diagnostics" },
    ["<leader>cc"] = { ":Lspsaga show_cursor_diagnostics<CR>", "Jump Diagnostic" },
    ["[e"] = { ":Lspsaga diagnostic_jump_prev<CR>", "Jump Diagnostic (Previous)" },
    ["]e"] = { ":Lspsaga diagnostic_jump_next<CR>", "Jump Diagnostic (Next)" },
    ["<leader>1"] = { ":Lspsaga term_toggle<CR>", "Float Terminal" },
  },
}
return M
