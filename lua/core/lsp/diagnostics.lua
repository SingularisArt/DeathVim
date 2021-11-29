--local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

--for type, icon in pairs(signs) do
  --local hl = "DiagnosticSign" .. type
  --vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
--end

require('lspkind').init({
  -- enables text annotations
  --
  -- default: true
  with_text = true,

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "[]",
    Method = "[]",
    Function = "[]",
    Constructor = "[]",
    Field = "[ﰠ]",
    Variable = "[]",
    Class = "[ﴯ]",
    Interface = "[]",
    Module = "[]",
    Property = "[ﰠ]",
    Unit = "[塞]",
    Value = "[]",
    Enum = "[]",
    Keyword = "[]",
    Snippet = "[]",
    Color = "[]",
    File = "[]",
    Reference = "[]",
    Folder = "[]",
    EnumMember = "[]",
    Constant = "[]",
    Struct = "[פּ]",
    Event = "[]",
    Operator = "[]",
    TypeParameter = ""
  },
})
