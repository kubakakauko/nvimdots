local overrides = require "custom.configs.overrides"

local plugins = {
  -- LSP and Code Completion
  {
    "neovim/nvim-lspconfig", -- Configures Neovim's LSP client
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim", -- Enhances LSP diagnostics and formatting
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup {
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      }
    end,
  },

  -- {
  --   "phaazon/hop.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("hop").setup()
  --
  --     -- Define key mappings
  --     vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
  --     vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
  --   end,
  -- },

  {
    "ggandor/leap.nvim",
    name = "leap",
    event = "BufRead",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  -- Miscellaneous Code Navigation
  {
    "nacro90/numb.nvim", -- Shows line numbers with shortcuts
    opts = overrides.numb,
  },

  {
    "williamboman/mason.nvim", -- Snippets expansion and completion
    opts = overrides.mason,
  },

  -- Syntax and Tree Sitter
  {
    "nvim-treesitter/nvim-treesitter", -- Syntax highlighting and better code analysis
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua", -- File explorer
    opts = overrides.nvimtree,
  },

  -- Text Editing and Enhancements
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "vimwiki/vimwiki", -- Personal wiki and note-taking
    lazy = false,
    config = function()
      require "custom.configs.vimwiki"
    end,
  },

  {
    "windwp/nvim-spectre", -- Search and replace with preview
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },

  {
    "andymass/vim-matchup", -- Improved matching for %, [], {}, (), etc.
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Window Management
  {
    "s1n7ax/nvim-window-picker", -- Improved window selection
    version = "2.*",
    opts = overrides.window_picker,
  },

  {
    "sindrets/diffview.nvim", -- Side-by-side diff view
    event = "BufRead",
  },

  -- Git Integration
  {
    "tpope/vim-fugitive", -- Git commands and integration
    lazy = false,
    ft = { "fugitive" },
    opts = overrides.fugitive,
  },

  -- Language-Specific Plugins
  {
    "JoosepAlviste/nvim-ts-context-commentstring", -- Automatic context-aware comments
    event = "BufRead",
  },

  {
    "rmagatti/goto-preview", -- Previewing references and definitions
    opts = overrides.goto_preview,
    lazy = false,
    config = function()
      require("goto-preview").setup {}
    end,
  },

  {
    "ray-x/lsp_signature.nvim", -- Signature help for LSP functions
    event = "BufRead",
    config = function()
      require("lsp_signature").on_attach()
    end,
  },

  {
    "ahmedkhalf/lsp-rooter.nvim", -- Automatic root directory for LSP clients
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },

  {
    "simrat39/symbols-outline.nvim", -- Symbol outline and navigation
    lazy = false,
    opts = overrides.symbols_outline,
    config = function()
      require("symbols-outline").setup()
    end,
  },

  {
    "folke/todo-comments.nvim", -- Highlight and manage TODO comments
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  -- Cursor and Text Enhancements
  {
    "itchyny/vim-cursorword", -- Highlight current word in insert mode
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command "augroup user_plugin_cursorword"
      vim.api.nvim_command "augroup END"
    end,
  },

  {
    "felipec/vim-sanegx", -- Improved gx mapping behavior
    event = "BufRead",
  },

  {
    "monaqa/dial.nvim", -- Easy increment/decrement of numbers
    lazy = false,
    config = function()
      require "custom.configs.dial"
    end,
  },

  {
    "folke/trouble.nvim", -- Displaying diagnostics and errors
    cmd = "TroubleToggle",
  },

  {
    "sitiom/nvim-numbertoggle", -- Toggling line numbers
  },

  {
    "mg979/vim-visual-multi", -- Multiple cursors for Vim
    lazy = false,
  },

  -- Rust Development
  {
    "racer-rust/vim-racer", -- Rust code completion
    ft = "rust",
  },

  {
    "timonv/vim-cargo", -- Rust build system
    ft = "rust",
  },

  -- Completion and Snippets
  {
    "zbirenbaum/copilot.lua", -- Snippet expansion with UltiSnips integration
    event = "InsertEnter",
    opts = overrides.copilot,
  },

  {
    "hrsh7th/nvim-cmp", -- LSP completion
    dependencies = {
      {
        "zbirenbaum/copilot-cmp", -- Copilot integration with nvim-cmp
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = overrides.nvim_cmp,
  },

  -- Rust Tools Integration
  {
    "simrat39/rust-tools.nvim", -- Rust development tools
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },

  -- Debugging and DAP
  {
    "mfussenegger/nvim-dap", -- Debug Adapter Protocol integration
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },

  {
    "saecki/crates.nvim", -- Cargo commands and crate search
    ft = { "toml" },
    init = function()
      require("core.utils").load_mappings "crates"
    end,
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
    end,
  },

  {
    "rust-lang/rust.vim", -- Rust syntax and formatting
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text", -- Virtual text for DAP messages
    lazy = false,
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },

  -- Miscellaneous and Utilities
  {
    "kwkarlwang/bufresize.nvim", -- Resize windows with ease
    config = function()
      require("bufresize").setup {}
    end,
  },

  { "lukas-reineke/cmp-under-comparator", lazy = false },

  { "mbbill/undotree", cmd = "UndotreeToggle" }, -- Undotree history visualizer

  -- Legacy Plugins
  { "j-hui/fidget.nvim", lazy = false, tag = "legacy", opts = require "custom.configs.fidget" },
  { "machakann/vim-highlightedyank", lazy = false },

  -- Git Conflict Resolution
  {
    "akinsho/git-conflict.nvim", -- Git conflict management
    version = "*",
    lazy = false,
    config = function()
      require("git-conflict").setup {}
    end,
  },

  -- LSP Enhancements
  {
    "nvimdev/lspsaga.nvim", -- LSP code action, rename, and more
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "VonHeikemen/lsp-zero.nvim", -- LSP diagnostic integration
    branch = "v2.x",
    config = function()
      require("custom.configs.lsp-zero").setup()
    end,
    dependencies = {
      {
        "williamboman/mason.nvim", -- Improved snippets for LSP
        build = ":MasonUpdate",
        config = function()
          require("mason").setup()
        end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/cmp-nvim-lsp" },
      {
        "L3MON4D3/LuaSnip", -- Snippets engine for Lua
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
  },

  -- OmniSharp Integration (C# Development)
  {
    "OmniSharp/omnisharp-vim", -- OmniSharp integration for C#
    lazy = false,
    ft = { "cs", "axaml.cs", "axaml" },
  },

  -- Syntax Highlighting
  { "sheerun/vim-polyglot", event = "LspAttach" }, -- Automatic language support
  { "nickspoons/vim-sharpenup", ft = { "cs", "axaml.cs", "axaml" } }, -- C# syntax highlighting

  -- Auto Completion
  { "prabirshrestha/asyncomplete.vim", event = "BufReadPre" },

  -- Themes
  { "folke/tokyonight.nvim" },

  -- Visual Multi Selection
  { "mg979/vim-visual-multi", lazy = false },

  -- Language-Specific Plugins (Rust Development)
  { "racer-rust/vim-racer", ft = "rust" },
  { "timonv/vim-cargo", ft = "rust" },
  {
    "TakenMC/presence.nvim",
    lazy = false,
    config = function()
      require("presence").setup(overrides.presence)
    end,
  },
}

return plugins
