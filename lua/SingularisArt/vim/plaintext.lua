local autocmd = SingularisArt.vim.autocmd
local inoremap = SingularisArt.vim.inoremap
local nnoremap = SingularisArt.vim.nnoremap
local setlocal = SingularisArt.vim.setlocal

-- Switch to plaintext mode with: call SingularisArt#functions#plaintext()
local plaintext = function()
  setlocal('concealcursor', 'nc')
  setlocal('list', false)
  setlocal('textwidth', 0)
  setlocal('wrap')
  setlocal('wrapmargin', 0)

  SingularisArt.vim.spell()

  inoremap('!', '!<C-g>u', {buffer = true})
  inoremap(',', ',<C-g>u', {buffer = true})
  inoremap('.', '.<C-g>u', {buffer = true})
  inoremap(':', ':<C-g>u', {buffer = true})
  inoremap(';', ';<C-g>u', {buffer = true})
  inoremap('?', '?<C-g>u', {buffer = true})

  nnoremap('j', 'gj', {buffer = true})
  nnoremap('k', 'gk', {buffer = true})

  -- Ideally would keep 'list' set, and restrict 'listchars' to just
  -- show whitespace errors, but 'listchars' is global and I don't want
  -- to go through the hassle of saving and restoring.
  autocmd('BufWinEnter', '<buffer>', 'match Error /\\s\\+$/')
  autocmd('InsertEnter', '<buffer>', 'match Error /\\s\\+\\%#\\@<!$/')
  autocmd('InsertLeave', '<buffer>', 'match Error /\\s\\+$/')
  autocmd('BufWinLeave', '<buffer>', 'call clearmatches()')
end

return plaintext

