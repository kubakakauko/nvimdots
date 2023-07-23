local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local builtin = null_ls.builtins
-- code action sources
local code_actions = builtin.code_actions

-- diagnostic sources
local diagnostics = builtin.diagnostics

-- formatting sources
local formatting = builtin.formatting

-- hover sources
local hover = builtin.hover

-- completion sources
local completion = builtin.completion



local sources = {

  -- webdev stuff
  formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  formatting.stylua,

  -- cpp
  formatting.clang_format,

  -- yamlfix
  formatting.yamlfix,

  -- Python
  formatting.autopep8,
  diagnostics.flake8,

  -- Rust
  formatting.rustfmt,

  -- JSON
  formatting.fixjson,
  diagnostics.jsonlint,

  -- SQL
  formatting.sqlfmt,
  diagnostics.sqlfluff,

  -- YAML
  formatting.yamlfmt,
  diagnostics.yamllint,

  -- Dockerfile
  diagnostics.hadolint,

  -- CSS
  diagnostics.stylelint,

  -- TypeScript
  formatting.prettier.with { filetypes = { "typescript" } },

}


local rust_sources = {
  formatting.rustfmt,
}

-- Add Rust sources to the existing sources table
for _, source in ipairs(rust_sources) do
  table.insert(sources, source)
end



local javascript_sources = {
  formatting.prettier.with { filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" } },
}

-- Add JavaScript sources to the existing sources table
for _, source in ipairs(javascript_sources) do
  table.insert(sources, source)
end

null_ls.setup ({
  sources = sources
})
