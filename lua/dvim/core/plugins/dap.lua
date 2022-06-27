local M = {}

M.config = function()
  dvim.builtin.plugins.dap = {
    on_config_done = nil,
    breakpoint = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    breakpoint_rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  }
end

M.setup = function()
  M.config()

  local dap = require("dap")

  if dvim.use_icons then
    vim.fn.sign_define("DapBreakpoint", dvim.builtin.plugins.dap.breakpoint)
    vim.fn.sign_define("DapBreakpointRejected", dvim.builtin.plugins.dap.breakpoint_rejected)
    vim.fn.sign_define("DapStopped", dvim.builtin.plugins.dap.stopped)
  end

  dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

  if dvim.builtin.plugins.dap.on_config_done then
    dvim.builtin.plugins.dap.on_config_done(dap)
  end
end

return M
