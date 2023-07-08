local dap = require('dap')

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

dap.adapters.cpp = {
  type = 'executable';
  command = '/path/to/vscode-cpptools/debugAdapters/OpenDebugAD7';
  args = {};
}
