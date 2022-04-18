vim.cmd([[set completeopt=menuone,noinsert,noselect]])

local cmp_status, cmp = pcall(require, "cmp")

if not cmp_status then
	vim.notify("Please Install 'cmp'")
	return
end

local kind_icons = {
	Class = " Class",
	Color = " Color",
	Constant = "ﲀ Constant",
	Constructor = " Constructor",
	Enum = "練Enum",
	EnumMember = " Enum Member",
	Event = " Event",
	Field = " Field",
	File = " File",
	Folder = " Folder",
	Function = " Function",
	Interface = "ﰮ Interface",
	Keyword = " Keyword",
	Method = " Method",
	Module = " Module",
	Operator = " Operator",
	Property = " Property",
	Reference = " Reference",
	Snippet = " Snippet",
	Struct = " Struct",
	Text = " Text",
	TypeParameter = " Type Parameter",
	Unit = "塞 Unit",
	Value = " Value",
	Variable = " Variable",
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

	-- documentation = {
	-- },
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
				vim_item.kind = " TabNine"
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

local Job = require("plenary.job")

local source = {}

source.new = function()
	local self = setmetatable({ cache = {} }, { __index = source })

	return self
end

source.complete = function(self, _, callback)
	local bufnr = vim.api.nvim_get_current_buf()

	-- This just makes sure that we only hit the GH API once per session.
	--
	-- You could remove this if you wanted, but this just makes it so we're
	-- good programming citizens.
	if not self.cache[bufnr] then
		Job
			:new({
				-- Uses `gh` executable to request the issues from the remote repository.
				"gh",
				"issue",
				"list",
				"--limit",
				"1000",
				"--json",
				"title,number,body",

				on_exit = function(job)
					local result = job:result()
					local ok, parsed = pcall(vim.json.decode, table.concat(result, ""))
					if not ok then
						vim.notify("Failed to parse gh result")
						return
					end

					local items = {}
					for _, gh_item in ipairs(parsed) do
						gh_item.body = string.gsub(gh_item.body or "", "\r", "")

						table.insert(items, {
							label = string.format("#%s", gh_item.number),
							documentation = {
								kind = "markdown",
								value = string.format("# %s\n\n%s", gh_item.title, gh_item.body),
							},
						})
					end

					callback({ items = items, isIncomplete = false })
					self.cache[bufnr] = items
				end,
			})
			:start()
	else
		callback({ items = self.cache[bufnr], isIncomplete = false })
	end
end

source.get_trigger_characters = function()
	return { "#" }
end

source.is_available = function()
	return vim.bo.filetype == "gitcommit"
end

require("cmp").register_source("gh_issues", source.new())

vim.cmd[[
highlight! CmpItemAbbrMatch guibg=NONE guifg=#fff700
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#fff700
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4

highlight! CmpItemKindEnum          guibg=NONE guifg=#7D8471
highlight! CmpItemKindInterface     guibg=NONE guifg=#252850
highlight! CmpItemKindFile          guibg=NONE guifg=#015D52
highlight! CmpItemKindText          guibg=NONE guifg=#781F19
highlight! CmpItemKindUnit          guibg=NONE guifg=#6C6874
highlight! CmpItemKindClass         guibg=NONE guifg=#282828
highlight! CmpItemKindColor         guibg=NONE guifg=#587246
highlight! CmpItemKindEvent         guibg=NONE guifg=#6C7059
highlight! CmpItemKindField         guibg=NONE guifg=#6F4F28
highlight! CmpItemKindValue         guibg=NONE guifg=#E7EBDA
highlight! CmpItemKindFolder        guibg=NONE guifg=#F3DA0B
highlight! CmpItemKindMethod        guibg=NONE guifg=#1E1E1E
highlight! CmpItemKindModule        guibg=NONE guifg=#CFD3CD
highlight! CmpItemKindStruct        guibg=NONE guifg=#A18594
highlight! CmpItemKindDefault       guibg=NONE guifg=#4C9141
highlight! CmpItemKindKeyword       guibg=NONE guifg=#CB3234
highlight! CmpItemKindSnippet       guibg=NONE guifg=#4E5754
highlight! CmpItemKindConstant      guibg=NONE guifg=#FF7514
highlight! CmpItemKindFunction      guibg=NONE guifg=#025669
highlight! CmpItemKindOperator      guibg=NONE guifg=#686C5E
highlight! CmpItemKindProperty      guibg=NONE guifg=#F4F4F4
highlight! CmpItemKindVariable      guibg=NONE guifg=#6D3F5B
highlight! CmpItemKindReference     guibg=NONE guifg=#474B4E
highlight! CmpItemKindEnumMember    guibg=NONE guifg=#193737

highlight! CmpItemKindEnumDefault          guibg=NONE guifg=#7D8471
highlight! CmpItemKindInterfaceDefault     guibg=NONE guifg=#252850
highlight! CmpItemKindFileDefault          guibg=NONE guifg=#015D52
highlight! CmpItemKindTextDefault          guibg=NONE guifg=#781F19
highlight! CmpItemKindUnitDefault          guibg=NONE guifg=#6C6874
highlight! CmpItemKindClassDefault         guibg=NONE guifg=#282828
highlight! CmpItemKindColorDefault         guibg=NONE guifg=#587246
highlight! CmpItemKindEventDefault         guibg=NONE guifg=#6C7059
highlight! CmpItemKindFieldDefault         guibg=NONE guifg=#6F4F28
highlight! CmpItemKindValueDefault         guibg=NONE guifg=#E7EBDA
highlight! CmpItemKindFolderDefault        guibg=NONE guifg=#F3DA0B
highlight! CmpItemKindMethodDefault        guibg=NONE guifg=#1E1E1E
highlight! CmpItemKindModuleDefault        guibg=NONE guifg=#CFD3CD
highlight! CmpItemKindStructDefault        guibg=NONE guifg=#A18594
highlight! CmpItemKindDefaultDefault       guibg=NONE guifg=#4C9141
highlight! CmpItemKindKeywordDefault       guibg=NONE guifg=#CB3234
highlight! CmpItemKindSnippetDefault       guibg=NONE guifg=#4E5754
highlight! CmpItemKindConstantDefault      guibg=NONE guifg=#FF7514
highlight! CmpItemKindFunctionDefault      guibg=NONE guifg=#025669
highlight! CmpItemKindOperatorDefault      guibg=NONE guifg=#686C5E
highlight! CmpItemKindPropertyDefault      guibg=NONE guifg=#F4F4F4
highlight! CmpItemKindVariableDefault      guibg=NONE guifg=#6D3F5B
highlight! CmpItemKindReferenceDefault     guibg=NONE guifg=#474B4E
highlight! CmpItemKindEnumMemberDefault    guibg=NONE guifg=#193737
]]

