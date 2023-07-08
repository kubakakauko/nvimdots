local dapui = require('dapui')

dapui.setup({
    sidebar = {
        open_on_start = true,
        elements = {
            { id = "scopes", name = "Scopes" },
            { id = "breakpoints", name = "Breakpoints" },
            { id = "stacks", name = "Call Stack" },
            { id = "watches", name = "Watches" },
        },
        size = 40,
        position = "left",
    },
    floating = {
        max_height = nil,
        max_width = nil,
        mappings = {
            close = { "q", "<Esc>" },
        }
    },
})
