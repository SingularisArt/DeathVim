vim.cmd([[set completeopt=menuone,noinsert,noselect]])

local cmp_status, cmp = pcall(require, "cmp")
-- local cmp_ultisnips_status, cmp_ultisnips_mappings = pcall(require, "cmp_ultisnips_mapping")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

if not cmp_status then
	vim.notify("Please Install 'cmp'")
	return
end

-- if not cmp_ultisnips_status then
-- 	vim.notify("Please Install 'cmp-ultisnips'")
-- 	return
-- end

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

	mapping = {
		["<C-y>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),

    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    ['<A-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<A-k>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
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
