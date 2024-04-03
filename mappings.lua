---@type MappingsTable
local M = {}

M.plugins = {
  n = {
    -- vim-marked
    ["<leader>mo"] = { "<cmd>MarkedOpen<cr>", "Open marked" },

    -- vim-pencil
    ["<leader>qc"] = { "<Plug>ReplaceWithCurly", "Curl quotes" },
    ["<leader>qs"] = { "<Plug>ReplaceWithStraight", "Straighten quotes" },

    -- telescope
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Find buffer" },
    ["<leader>fq"] = { "<cmd>Telescope marks<cr>", "Find mark" },
    ["<leader>fr"] = { "<cmd>Telescope lsp_references<cr>", "Find references (LSP)" },
    ["<leader>fs"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Find symbols (LSP)" },
    ["<leader>fc"] = { "<cmd>Telescope lsp_incoming_calls<cr>", "Find incoming calls (LSP)" },
    ["<leader>fk"] = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Find outgoing calls (LSP)" },
    ["<leader>fi"] = { "<cmd>Telescope lsp_implementations<cr>", "Find implementations (LSP)" },
    ["<leader>fx"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Find errors (LSP)" },
    
    -- trouble
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Display errors" },
    ["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace errors" },
    ["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document errors" },

    -- symbols-outline
    ["<leader>o"] = { "<cmd>SymbolsOutline<cr>", "Show symbols" },

    -- oil

    -- vim-test
    ["<leader>vt"] = { "<cmd>TestNearest<cr>", "Test nearest" },
    ["<leader>vf"] = { "<cmd>TestFile<cr>", "Test file" },
    ["<leader>vs"] = { "<cmd>TestSuite<cr>", "Test suite" },
    ["<leader>vl"] = { "<cmd>TestLast<cr>", "Test last" },
    ["<leader>vg"] = { "<cmd>TestVisit<cr>", "Go to test" },
  }
}
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


M.dap = {
  n = {
    ["<leader>bb"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint" },
    ["<leader>bc"] = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Conditional breakpoint" },
    ["<leader>bl"] = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Log point" },
    ["<leader>br"] = { "<cmd>lua require'dap'.clear_breakpoints()<cr>", "Clear breakpoints" },
    ["<leader>ba"] = { "<cmd>Telescope dap list_breakpoints<cr>", "List breakpoints" },
    
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    ["<leader>dj"] = { "<cmd>lua require'dap'.step_over()<cr>", "Step over" },
    ["<leader>dk"] = { "<cmd>lua require'dap'.step_into()<cr>", "Step into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_out()<cr>", "Step out" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    ["<leader>dt"] = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "REPL" },
    ["<leader>dl"] = { "<cmd>lua require'dap'.run_last()<cr>", "Run last" },
    ["<leader>df"] = { "<cmd>Telescope dap frames<cr>", "Frames" },
    ["<leader>dh"] = { "<cmd>Telescope dap commands<cr>", "Commands" },
  }
}

M.dapui = {
  plugin = true,
  n = {
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
    ["<leader>ca"] = { ":Lspsaga code_action<CR>", "Code Action" },
    ["K"] = { ":Lspsaga hover_doc<CR>", "Hover Doc" },
    ["<C-f>"] = { ":Lspsaga smart_scroll_with_saga(1)<CR>", "Scroll Down Hover Doc" },
    ["<C-b>"] = { ":Lspsaga smart_scroll_with_saga(-1)<CR>", "Scroll Up Hover Doc" },
    ["gs"] = { ":Lspsaga signature_help<CR>", "SignatureHelp" },
    ["<leader>R"] = { ":Lspsaga rename<CR>", "Rename" },
    ["D"] = { ":Lspsaga preview_definition<CR>", "Preview Definition" },
    ["<leader>cd"] = { ":Lspsaga show_line_diagnostics<CR>", "Show Diagnostics" },
    ["<leader>cc"] = { ":Lspsaga show_cursor_diagnostics<CR>", "Jump Diagnostic" },
    ["[e"] = { ":Lspsaga diagnostic_jump_prev<CR>", "Jump Diagnostic (Previous)" },
    ["]e"] = { ":Lspsaga diagnostic_jump_next<CR>", "Jump Diagnostic (Next)" },
    ["<leader>1"] = { ":Lspsaga term_toggle<CR>", "Float Terminal" },
  },
}
return M
