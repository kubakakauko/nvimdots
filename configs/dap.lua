local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-vscode',  -- Adjust this path if lldb-vscode is not in your PATH
  name = "lldb"
}

dap.adapters.python = {
  type = 'executable';
  command = 'python';
  args = {'-m', 'debugpy.adapter'};
}

dap.adapters.rust = {
  type = 'executable';
  command = 'rust-analyzer';
  args = {};
}

dap.configurations.rust = {
  {
    type = "lldb",
    request = "launch",
    name = "Debug",
    program = function()
      local cargo_toml_path = vim.fn.glob(vim.fn.getcwd() .. "/Cargo.toml")
      if cargo_toml_path ~= "" then
        local cargo_toml = vim.fn.readfile(cargo_toml_path)
        for _, line in ipairs(cargo_toml) do
          if line:match("^name%s*=%s*\"(.*)\"") then
            return vim.fn.getcwd() .. "/target/debug/" .. line:match("^name%s*=%s*\"(.*)\"")
          end
        end
      end
      error("Could not determine the name of the Rust program. Make sure your project has a Cargo.toml file with a name field.")
    end,
    cwd = '${workspaceFolder}',
  },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable('./venv/bin/python') == 1 then
        return './venv/bin/python'
      elseif vim.fn.executable('python3') == 1 then
        return 'python3'
      else
        return '/usr/bin/python'
      end
    end,
  },
}

dap.configurations.cs = {
    {
        name = "Launch",
        type = "dotnet_core", -- Use the dotnet_core adapter here
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
    },
}


dap.adapters.dotnet_core = {
    type = 'executable',
    command = 'dotnet',
    args = { 'lldb', '--interpreter=vscode' },
}



dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}
