local map = SingularisArt.vim.map

local imap = function (lhs, rhs, opts)
  opts = opts or {}
  return map('i', lhs, rhs, opts)
end

return imap
