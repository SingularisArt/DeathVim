local map = SingularisArt.vim.map
local shallow_merge = SingularisArt.util.shallow_merge

local cnoremap = function (lhs, rhs, opts)
  opts = opts or {}
  return map('c', lhs, rhs, shallow_merge(opts, {noremap = true}))
end

return cnoremap

