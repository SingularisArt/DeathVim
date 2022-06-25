local M = {}

local cmp = Utils.safe_require('cmp')
local cmp_dap = Utils.safe_require('cmp_dap')
local icons = Utils.safe_require('dvim.core.icons')
local kind_icons = icons.kind

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

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

    mapping = cmp.mapping.preset.insert {
      ["<C-y>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      ['<A-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<A-k>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        -- Kind icons
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

        if entry.source.name == "cmp_tabnine" then
          vim_item.kind = icons.misc.Robot
          vim_item.kind_hl_group = "CmpItemKindTabnine"
        end

        if entry.source.name == "copilot" then
          vim_item.kind = icons.git.Octoface
          vim_item.kind_hl_group = "CmpItemKindCopilot"
        end

        if entry.source.name == "emoji" then
          vim_item.kind = icons.misc.Smiley
          vim_item.kind_hl_group = "CmpItemKindEmoji"
        end

        -- NOTE: order matters
        vim_item.menu = ({
          copilot = "",
          cmp_tabnine = "",
          nvim_lsp = "",
          nvim_lua = "",
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
      { name = "copilot" },
      { name = "cmp_tabnine" },
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
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
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
  },
}

M.setup = function()
  require("cmp").setup(dvim.builtin.plugins.cmp)

  Utils.safe_require('dvim.core.plugins.cmp.cmp_github_issues')
  Utils.safe_require('dvim.core.plugins.cmp.cmp_emails').setup()
end

return M
