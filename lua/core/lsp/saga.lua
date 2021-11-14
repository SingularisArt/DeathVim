local saga = require('lspsaga')

saga.init_lsp_saga {
  error_sign = ' ',
  warn_sign = '' ,
  hint_sign = '' ,
  infor_sign = ' ',
  code_action_prompt = {
    enable = false,
  },
  border_style = "round",
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 10,
      prefix = ''
    }
  }
)
