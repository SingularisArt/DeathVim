local g = vim.g
local cnf = require('SingularisArt.theme.config');
local mappings = require('SingularisArt.theme.mapper')

vim.cmd('hi clear')

if vim.fn.exists("syntax_on") then
  vim.cmd('syntax reset')
end


local highlight = function(tbl)
  for group,color in pairs(tbl) do
    local style = color.style and "gui=" .. color.style or "gui=NONE"
    local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
    local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
    local sp = color.sp and "guisp=" .. color.sp or ""
    local blend = color.blend and "blend=" .. color.blend or ""
    local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp .. " " .. blend

    vim.cmd(hl)
    if color.link then
      vim.cmd("highlight! link " .. group .. " " .. color.link)
    end
  end
end

local terminal = function(cp)
  g.terminal_color_0 = cp.gray0
  g.terminal_color_8 = cp.gray1
  g.terminal_color_1 = cp.red
  g.terminal_color_9 = cp.red
  g.terminal_color_2 = cp.green
  g.terminal_color_10 = cp.green
  g.terminal_color_3 = cp.yellow
  g.terminal_color_11 = cp.yellow
  g.terminal_color_4 = cp.blue
  g.terminal_color_12 = cp.blue
  g.terminal_color_5 = cp.pink
  g.terminal_color_13 = cp.pink
  g.terminal_color_6 = cp.sky
  g.terminal_color_14 = cp.sky
  g.terminal_color_7 = cp.white
  g.terminal_color_15 = cp.white
end

g.colors_name = "Death"
highlight(mappings.base)
highlight(mappings.integrations)
if cnf['term_colors'] then terminal(mappings.terminal) end
