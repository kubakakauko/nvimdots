local autocmd = vim.api.nvim_create_autocmd

-- Macos settings ()
vim.g.neovide_input_macos_alt_is_meta=true
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Set line numbers on BufRead and BufNewFile
autocmd("BufRead,BufNewFile", {
  pattern = "*",
  command = "set number relativenumber",
})
