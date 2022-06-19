local M = require('SingularisArt.functions')

local dap = M.safe_require('dap')
local nvim_dap_virtual_text = M.safe_require('nvim-dap-virtual-text')
local dapui = M.safe_require('dapui')
local icons = M.safe_require('SingularisArt.icons')

dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input "Host [127.0.0.1]: "
      if value ~= "" then
        return value
      end
      return "127.0.0.1"
    end,
    port = function()
      local val = tonumber(vim.fn.input("Port: ", "54321"))
      assert(val, "Please provide a port number")
      return val
    end,
  },
}

vim.g.dap_virtual_text = true

nvim_dap_virtual_text.setup()

dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "double", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
}

vim.fn.sign_define('DapBreakpoint', { text = icons.ui.Bug })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
dap.adapters.nlua = function(callback, config)
  callback { type = "server", host = config.host, port = config.port }
end

require('dap-python').setup('/usr/bin/python3.10')
