local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "pyright", "sqlls", "lua_ls", "tsserver", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Setup language servers.
lspconfig.pyright.setup {}

-- lspconfig.eslint.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
-- }

lspconfig.sqlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "sql-language-server", "up", "--method", "stdio" },
}

-- Setup language server for OmniSharp (C# and .NET development)

lspconfig.omnisharp.setup({
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    on_attach = on_attach,
    capabilities = capabilities,
    -- filetypes = { "cs", "cshtml", "razor", "axaml.cs", "axaml" },
    -- Additional configurations for OmniSharp (if needed)
})

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
      },
    },
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ["rust-analyzer"] = {},
  },
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space><space>", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- vim.keymap.set("n", "<space>f", function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})


lspconfig.jdtls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "jdtls" },
  filetypes = { "java" },
  root_dir = function(fname)
    return require("jdtls.setup").find_root({ fname = fname })
  end,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        }
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-20",
            path = "/Library/Java/JavaVirtualMachines/jdk-20.jdk/Contents/Home",
          },
        },
      },
    },
  },
}
--
-- lspconfig.pyright.setup { blabla}
--
--#region

lspconfig['dartls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig['lua_ls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  }
}

lspconfig['ltex'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc" },
  settings = {
    ltex = {
      language = "en-CA",
    }
  }
}

lspconfig['gopls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  }
}

lspconfig['pyright'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      analysis = {
        useLibraryCodeForTypes = true,
      },
    },
  }
}

lspconfig['solargraph'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig['tsserver'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
