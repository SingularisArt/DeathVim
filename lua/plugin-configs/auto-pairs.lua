require('nvim-autopairs').setup{}

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.add_rule(Rule("$","$","tex"))
npairs.add_rule(Rule("\\[","\n\\].","tex"))

