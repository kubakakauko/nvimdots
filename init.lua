local autocmd = vim.api.nvim_create_autocmd

vim.g.OmniSharp_server_use_mono = 1
vim.g.OmniSharp_server_use_net6 = 0
vim.g.OmniSharp_loglevel = "DEBUG"
vim.g.loaded_python3_provider=1
vim.g.loaded_node_provider=1

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

autocmd('User', {
  pattern = 'GitConflictDetected',
  callback = function()
    vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
    vim.keymap.set('n', 'cww', function()
      engage.conflict_buster()
      create_buffer_local_mappings()
    end)
  end
})

-- Autocmd to change working directory to the current file's location
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local path = vim.fn.expand('%:p:h')
    vim.cmd('lcd ' .. path)
  end,
})
