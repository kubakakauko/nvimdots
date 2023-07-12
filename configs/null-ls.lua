local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- yamlfix
  b.formatting.yamlfix,

  -- Python
  b.formatting.autopep8,
  b.diagnostics.flake8,

  -- Rust
  b.formatting.rustfmt,

  -- JSON
  b.formatting.fixjson,
  b.diagnostics.jsonlint,

  -- SQL
  b.formatting.sqlfmt,
  b.diagnostics.sqlfluff,

  -- YAML
  b.formatting.yamlfmt,
  b.diagnostics.yamllint,

  -- Dockerfile
  b.diagnostics.hadolint,

  -- CSS
  b.diagnostics.stylelint,

  -- TypeScript
  b.formatting.prettier.with { filetypes = { "typescript" } },

}

null_ls.setup {
  debug = false,
  sources = sources,
}
