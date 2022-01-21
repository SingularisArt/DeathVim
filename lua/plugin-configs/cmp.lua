vim.cmd([[set completeopt=menuone,noinsert,noselect]])

local cmp_status, cmp = pcall(require, "cmp")

if not cmp_status then
	vim.notify("Please Install 'cmp'")
	return
end

local kind_icons = {
  Class = " ",
  Color = " ",
  Constant = "ﲀ ",
  Constructor = " ",
  Enum = "練",
  EnumMember = " ",
  Event = " ",
  Field = " ",
  File = "",
  Folder = " ",
  Function = " ",
  Interface = "ﰮ ",
  Keyword = " ",
  Method = " ",
  Module = " ",
  Operator = "",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = " ",
  Unit = "塞",
  Value = " ",
  Variable = " ",
}

Vscode = vim.lsp.protocol.make_client_capabilities()

local source_mapping = {
  nvim_lsp = "(LSP)",
  nvim_lua = "(Lua)",
  latex_symbols = "(LaTeX)",
  ultisnips = "(Snippet)",
  cmp_tabnine = "(TabNine)",
  calc = "(Calculator)",
  gh_issues = "(Issues)",
  path = "(Path)",
  buffer = "(Buffer)",
  emoji = "(Emoji)",
  spell = "(Spell)",
}

Capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
Vscode.textDocument.completion.completionItem.snippetSupport = true

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      --require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    end,
  },

  mapping = {
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<A-p>"] = cmp.mapping.scroll_docs(-4),
    ["<A-n>"] = cmp.mapping.scroll_docs(4),
    ["<C-b>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  },

  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "latex_symbols" },
    { name = "ultisnips" },
    { name = "cmp_tabnine" },
    { name = "calc" },
    { name = "gh_issues" },
    { name = "path" },
    { name = "buffer" },
    { name = "emoji" },
    { name = "spell" },
  }),

  experimental = {
    native_menu = false,
    ghost_text = true,
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      if entry.source.name == "cmp_tabnine" then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. " " .. menu
        end
        vim_item.kind = ""
      end
      vim_item.menu = menu
      return vim_item
    end,
  },
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
  },
})

require("plugin-configs.cmp_gh")
--require('plugin-configs.cmp_tn')
