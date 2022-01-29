local airline_status, autopairs = pcall(require, "nvim-autopairs")

if not airline_status then
	vim.notify("Please Install 'nvim-autopairs'")
	return
end

autopairs.setup({})

local Rule = require("nvim-autopairs.rule")
local npairs = require("nvim-autopairs")

npairs.add_rule(Rule("$", "$", "tex"))
npairs.add_rule(Rule("\\[", "\n\\].", "tex"))

