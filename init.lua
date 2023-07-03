local autocmd = vim.api.nvim_create_autocmd


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
