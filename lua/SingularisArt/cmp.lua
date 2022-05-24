local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local source_mapping = {
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	latex_symbols = "[LaTeX]",
	ultisnips = "[Snippet]",
	calc = "[Calculator]",
	path = "[Path]",
	buffer = "[Buffer]",
  cmp_tabnine = '[TabNine]',
	gh_issues = "[Issues]",
}

cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			--require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
		end,

		enabled = function()
			local lnum, col = vim.fn.line("."), math.min(vim.fn.col("."), #vim.fn.getline("."))
			for _, syn_id in ipairs(vim.fn.synstack(lnum, col)) do
				syn_id = vim.fn.synIDtrans(syn_id) -- Resolve :highlight links
				if vim.fn.synIDattr(syn_id, "name") == "Comment" then
					return false
				end
			end
			return true
		end,
	},

	mapping = cmp.mapping.preset.insert({
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
	}),

  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    }
  },

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "latex_symbols" },
		{ name = "ultisnips" },
		{ name = "calc" },
		{ name = "path" },
		{ name = "buffer" },
    { name = 'cmp_tabnine' },
    { name = "gh_issues" },
	}),

	formatting = {
   fields = { "kind", "abbr", "menu" },
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

	experimental = {
		native_menu = false,
		ghost_text = true,
	},
}
