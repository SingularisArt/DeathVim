local M = {}

local cmp = require("cmp")
local cmp_dap = require("cmp_dap")
local icons = require("dvim.core.icons")
local kind_icons = icons.kind

vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

M.config = function()
  dvim.builtin.plugins.cmp = {
    active = true,
    setup = {
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        end,
      },

      enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or cmp_dap.is_dap_buffer()
      end,

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<m-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-c>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<m-j>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<m-k>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<m-c>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<S-CR>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),

        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

          if entry.source.name == "cmp_tabnine" then
            vim_item.kind = icons.misc.Robot
            vim_item.kind_hl_group = "CmpItemKindTabnine"
          end

          if entry.source.name == "emoji" then
            vim_item.kind = icons.misc.Smiley
            vim_item.kind_hl_group = "CmpItemKindEmoji"
          end

          -- NOTE: order matters
          vim_item.menu = ({
            nvim_lsp = "",
            nvim_lua = "",
            cmp_tabnine = "",
            latex_symbols = "",
            ultisnips = "",
            calc = "",
            path = "",
            buffer = "",
            emails = "",
            emoji = "",
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "cmp_tabnine" },
        { name = "latex_symbols" },
        { name = "ultisnips" },
        { name = "calc" },
        { name = "path" },
        { name = "buffer" },
        { name = "gh_issues" },
        { name = "emails" },
        { name = "emoji" },
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        documentation = {
          border = "rounded",
          winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },
        completion = {
          border = "rounded",
          winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
        },
      },
      experimental = {
        ghost_text = true,
        native_menu = false,
      },
    },
  }
end

M.setup = function()
  M.config()

  require("cmp").setup(dvim.builtin.plugins.cmp.setup)

  require("dvim.core.plugins.cmp.cmp_github_issues")
  require("dvim.core.plugins.cmp.cmp_emails").setup()
  require("dvim.core.plugins.cmp.cmp_autopairs").setup()
end

return M
