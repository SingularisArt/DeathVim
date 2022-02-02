local dap_status, dap = pcall(require, "dap")

if not dap_status then
  vim.notify("Please Install 'nvim-dap'")
  return
end

dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

require('dap-python').setup('/usr/bin/python3.10')
vim.g.dap_virtual_text = true

