local autocmd = vim.api.nvim_create_autocmd

vim.g.OmniSharp_server_use_mono = 1
vim.g.OmniSharp_server_use_net6 = 0
vim.g.OmniSharp_loglevel = "DEBUG"
vim.g.loaded_python3_provider = 1
vim.g.loaded_node_provider = 1


-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Set line numbers on BufRead and BufNewFile
--autocmd("BufRead,BufNewFile", {
--  pattern = "*",
--  command = "set number relativenumber",
--})

autocmd("User", {
  pattern = "GitConflictDetected",
  callback = function()
    vim.notify("Conflict detected in " .. vim.fn.expand "<afile>")
    vim.keymap.set("n", "cww", function()
      engage.conflict_buster()
      create_buffer_local_mappings()
    end)
  end,
})


-- Autocmd to create Git aliases
autocmd("BufEnter", {
  pattern = "*", -- Match any buffer with "git/" in the path
  callback = function()
    -- Define Git aliases using command
    vim.cmd("command! -buffer -nargs=* GA Git add <args>")
    vim.cmd("command! -buffer -nargs=* GC Git commit -m <args>")
    vim.cmd("command! -buffer -nargs=* GP Git push")
  end,
})




-- Function to get the root directory of the Git project
local function get_git_root()
  local git_root_cmd = "git rev-parse --show-toplevel 2>/dev/null"
  local handle = io.popen(git_root_cmd)
  local result = handle:read("*a")
  handle:close()
  return vim.fn.trim(result)
end

-- Function to change to the Git project root
function ChangeToGitRoot()
  local git_root = get_git_root()
  if git_root ~= "" then
    vim.fn.execute("lcd " .. git_root)
  else
    print("Not in a Git project.")
  end
end

-- Custom command to change the working directory to the Git project root
vim.cmd([[command! -nargs=0 GitRoot lua ChangeToGitRoot()]])
-- Autocmd to change the working directory to the current file's directory
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local file_path = vim.fn.expand("%:p:h")
    vim.fn.execute("lcd " .. file_path)
  end,
})


-- Autocmd to change the working directory to the current file's directory
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local file_path = vim.fn.expand("%:p:h")
    vim.fn.execute("lcd " .. file_path)
  end,
})
