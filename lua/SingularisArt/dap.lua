local dap_status_ok, dap = pcall(require, 'dap')
if not dap_status_ok then
  return
end

local status_ok, nvim_dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
if not status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, 'dapui')
if not dap_ui_status_ok then
  return
end

local icons_status, icons = pcall(require, 'SingularisArt.icons')
if not icons_status then
  return
end

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
