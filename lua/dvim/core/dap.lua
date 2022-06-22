local M = {}

M.config = function()
  dvim.builtin.dap = {
    active = false,
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
  local dap = require "dap"
  M.config()

  if dvim.use_icons then
    vim.fn.sign_define('DapBreakpoint', dvim.builtin.dap.breakpoint)
    vim.fn.sign_define("DapBreakpointRejected", dvim.builtin.dap.breakpoint_rejected)
    vim.fn.sign_define("DapStopped", dvim.builtin.dap.stopped)
  end

  dap.defaults.fallback.terminal_win_cmd = "50vsplit new"

  if dvim.builtin.dap.on_config_done then
    dvim.builtin.dap.on_config_done(dap)
  end
end

M.setup()
return M
