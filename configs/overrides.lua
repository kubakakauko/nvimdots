local M = {}

M.nvim_cmp = {
   sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
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

  filter_rules = {
    -- filter using buffer options
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },

      -- if the buffer type is one of following, the window will be ignored
      buftype = { "terminal" },
    },
  },
  other_win_hl_color = "#e35e4f",
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = false,
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
