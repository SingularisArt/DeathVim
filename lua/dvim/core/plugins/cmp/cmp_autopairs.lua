local M = {}

M.setup = function()
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")

  local handlers = require("nvim-autopairs.completion.handlers")

  cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done({
      filetypes = {
        -- "*" is a alias to all filetypes
        ["*"] = {
          ["("] = {
            kind = {
              cmp.lsp.CompletionItemKind.Function,
              cmp.lsp.CompletionItemKind.Method,
            },
            handler = handlers["*"],
          },
        },
      },
    })
  )
end

return M
