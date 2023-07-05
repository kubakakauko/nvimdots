local M = {}

M.nvim_notify = {
  -- Configuration options go here
  -- For example, to set the animation style:
  stages = "fade_in_slide_out",
  -- And to set the render style:
  render_style = "minimal",
  timeout = 5000,
}

M.ale = {
  fixers = {
    python = { "autopep8", "isort" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    rust = { "rustfmt" },
    lua = { "lua-format" },
  },
  fix_on_save = 1,
}

M.symbol_outline = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = "right",
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = "Pmenu",
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { "", "" },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = { "<Esc>", "q" },
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = "h",
    unfold = "l",
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
  symbols = {
    File = { icon = "", hl = "@text.uri" },
    Module = { icon = "", hl = "@namespace" },
    Namespace = { icon = "", hl = "@namespace" },
    Package = { icon = "", hl = "@namespace" },
    Class = { icon = "𝓒", hl = "@type" },
    Method = { icon = "ƒ", hl = "@method" },
    Property = { icon = "", hl = "@method" },
    Field = { icon = "", hl = "@field" },
    Constructor = { icon = "", hl = "@constructor" },
    Enum = { icon = "ℰ", hl = "@type" },
    Interface = { icon = "ﰮ", hl = "@type" },
    Function = { icon = "", hl = "@function" },
    Variable = { icon = "", hl = "@constant" },
    Constant = { icon = "", hl = "@constant" },
    String = { icon = "𝓐", hl = "@string" },
    Number = { icon = "#", hl = "@number" },
    Boolean = { icon = "⊨", hl = "@boolean" },
    Array = { icon = "", hl = "@constant" },
    Object = { icon = "⦿", hl = "@type" },
    Key = { icon = "🔐", hl = "@type" },
    Null = { icon = "NULL", hl = "@type" },
    EnumMember = { icon = "", hl = "@field" },
    Struct = { icon = "𝓢", hl = "@type" },
    Event = { icon = "🗲", hl = "@type" },
    Operator = { icon = "+", hl = "@operator" },
    TypeParameter = { icon = "𝙏", hl = "@parameter" },
    Component = { icon = "", hl = "@function" },
    Fragment = { icon = "", hl = "@constant" },
  },
}

M.goto_preview = {
  width = 120, -- Width of the floating window
  height = 50, -- Height of the floating window
  border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" }, -- Border characters of the floating window
  default_mappings = true, -- Bind default mappings
  debug = false, -- Print debug information
  opacity = 90, -- 0-100 opacity level of the floating window where 100 is fully transparent.
  resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
  post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
  references = { -- Configure the telescope UI for slowing the references cycling window.
    telescope = require("telescope.themes").get_dropdown { hide_preview = false },
  },
  -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
  focus_on_open = true, -- Focus the floating window when opening it.
  dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
  force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
  bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
  stack_floating_preview_windows = true, -- Whether to nest floating windows
  preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
}

M.nvim_cmp = {
  sources = {
    { name = "nvim_lsp", group_index = 2 },
    { name = "crates", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "copilot", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
  },
}

M.numb = {
  show_numbers = true,
  show_cursorline = true,
}

M.window_picker = {
  autoselect_one = true,
  include_current = false,
  selection_chars = "ARSTDHNEIO",
  other_win_hl_color = "#79C0FF",
  show_prompt = true,

  -- type of hints you want to get
  -- following types are supported
  -- 'statusline-winbar' | 'floating-big-letter'
  -- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
  -- 'floating-big-letter' draw big letter on a floating window
  -- used
  hint = "floating-big-letter",

  filter_rules = {
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      -- filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
      filetype = { "NvimTree", "neo-tree", "notify", "quickfix" },
      -- if the buffer type is one of following, the window will be ignored
      buftype = { "terminal" },
    },
  },

  -- This section contains picker specific configurations
  picker_config = {
    statusline_winbar_picker = {
      -- You can change the display string in status bar.
      -- It supports '%' printf style. Such as `return char .. ': %f'` to display
      -- buffer file path. See :h 'stl' for details.
      selection_display = function(char, windowid)
        return "%=" .. char .. "%="
      end,

      -- whether you want to use winbar instead of the statusline
      -- "always" means to always use winbar,
      -- "never" means to never use winbar
      -- "smart" means to use winbar if cmdheight=0 and statusline if cmdheight > 0
      use_winbar = "smart", -- "always" | "never" | "smart"
    },

    floating_big_letter = {
      -- window picker plugin provides bunch of big letter fonts
      -- fonts will be lazy loaded as they are being requested
      -- additionally, user can pass in a table of fonts in to font
      -- property to use instead

      font = "ansi-shadow", -- ansi-shadow |
    },
  },
  -- You can pass in the highlight name or a table of content to set as
  -- highlight
  highlights = {
    statusline = {
      focused = {
        fg = "#ededed",
        bg = "#e35e4f",
        bold = true,
      },
      unfocused = {
        fg = "#ededed",
        bg = "#44cc41",
        bold = true,
      },
    },
    winbar = {
      focused = {
        fg = "#ededed",
        bg = "#e35e4f",
        bold = true,
      },
      unfocused = {
        fg = "#ededed",
        bg = "#44cc41",
        bold = true,
      },
    },
  },
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = true,
  },
  panel = {
    enable = false,
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "rust",
  },

  context_commentstring = {
    enable = true,
  },

  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "cpptools",
    "cmake-language-server",

    -- python
    "python-lsp-server",
    "pyright",
    "autopep8",
    "pydocstyle",

    --rust
    "rust-analyzer",

    -- sql
    "sqls",
    "sqlls",
    "sqlfluff",
    "sqlfmt",

    -- yaml
    "yaml-language-server",
    "yamllint",
    "yamlfmt",

    -- json
    "json-lsp",
    "jsonlint",
    "fixjson",

    -- docker
    "dockerfile-language-server",
    "docker-compose-language-service",

    -- other languages
    "solidity-ls",
    "vim-language-server",
    "arduino-language-server",

    -- formatters and linters
    "stylelint-lsp",
    "docformatter",
    "commitlint",
    "cspell",
    "codespell",
    "cmakelang",
    "cmakelint",
    "actionlint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  sync_root_with_cwd = true,

  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
